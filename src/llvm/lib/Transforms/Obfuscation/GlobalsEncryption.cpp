#include "llvm/Transforms/Obfuscation/GlobalsEncryption.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Transforms/Obfuscation/Utils.h"

using namespace llvm;
namespace polaris {
#define KEY_LEN 4
static_assert(KEY_LEN > 0 && KEY_LEN <= 4);
PreservedAnalyses GlobalsEncryption::run(Module &M, ModuleAnalysisManager &AM) {
  process(M);
  return PreservedAnalyses::none();
}
Function *GlobalsEncryption::buildDecryptFunction(Module &M) {
  std::vector<Type *> Params;
  Params.push_back(Type::getInt8Ty(M.getContext())->getPointerTo());
  Params.push_back(Type::getInt8Ty(M.getContext())->getPointerTo());
  Params.push_back(Type::getInt64Ty(M.getContext()));
  Params.push_back(Type::getInt64Ty(M.getContext()));
  FunctionType *FT =
      FunctionType::get(Type::getVoidTy(M.getContext()), Params, false);
  Function *F = Function::Create(FT, GlobalValue::PrivateLinkage,
                                 Twine("__obfu_globalenc_dec"), M);
  BasicBlock *Entry = BasicBlock::Create(M.getContext(), "entry", F);
  BasicBlock *Cmp = BasicBlock::Create(M.getContext(), "cmp", F);
  BasicBlock *Body = BasicBlock::Create(M.getContext(), "body", F);
  BasicBlock *End = BasicBlock::Create(M.getContext(), "end", F);
  Function::arg_iterator Iter = F->arg_begin();
  Value *Data = Iter;
  Value *Key = ++Iter;
  Value *Len = ++Iter;
  Value *KeyLen = ++Iter;
  IRBuilder<> IRB(Entry);
  Value *I = IRB.CreateAlloca(IRB.getInt64Ty());
  IRB.CreateStore(IRB.getInt64(0), I);
  IRB.CreateBr(Cmp);

  IRB.SetInsertPoint(Cmp);

  Value *Cond = IRB.CreateICmpSLT(IRB.CreateLoad(IRB.getInt64Ty(), I), Len);
  IRB.CreateCondBr(Cond, Body, End);

  IRB.SetInsertPoint(Body);
  Value *IV = IRB.CreateLoad(IRB.getInt64Ty(), I);
  Value *KeyByte = IRB.CreateLoad(
      IRB.getInt8Ty(),
      IRB.CreateGEP(IRB.getInt8Ty(), Key, IRB.CreateSRem(IV, KeyLen)));
  Value *DataByte =
      IRB.CreateLoad(IRB.getInt8Ty(), IRB.CreateGEP(IRB.getInt8Ty(), Data, IV));
  Value *DecValue = IRB.CreateXor(KeyByte, DataByte);
  IRB.CreateStore(DecValue, IRB.CreateGEP(IRB.getInt8Ty(), Data, IV));
  IRB.CreateStore(IRB.CreateAdd(IV, IRB.getInt64(1)), I);
  IRB.CreateBr(Cmp);

  IRB.SetInsertPoint(End);
  IRB.CreateRetVoid();
  return F;
}
void __obfu_globalenc_enc(uint8_t *Data, uint8_t *Key, int64_t Len,
                          int64_t KeyLen) {
  for (int64_t i = 0; i < Len; i++) {
    Data[i] ^= Key[i % KeyLen];
  }
}
void GlobalsEncryption::process(Module &M) {

  const DataLayout &DL = M.getDataLayout();
  std::set<GlobalVariable *> GVs;
  for (Function &F : M) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        for (Value *Opnd : I.operands()) {
          if (!isa<GlobalVariable>(*Opnd)) {
            continue;
          }
          GlobalVariable *GV = (GlobalVariable *)Opnd;
          if (GV->isConstant() && GV->hasInitializer() &&
              (GV->getValueType()->isIntegerTy() ||
               GV->getValueType()->isArrayTy())) {
            GlobalValue::LinkageTypes LT = GV->getLinkage();
            if (LT == GlobalValue::InternalLinkage ||
                LT == GlobalValue::PrivateLinkage) {
              GVs.insert(GV);
            }
          }
        }
      }
    }
  }
  Function *DecFunc = buildDecryptFunction(M);
  for (GlobalVariable *GV : GVs) {
    bool Ok = true;
    std::vector<Instruction *> Insts;
    std::set<Function *> Funcs;
    for (auto Iter = GV->user_begin(); Iter != GV->user_end(); ++Iter) {
      Value *V = *Iter;
      if (!isa<Instruction>(*V)) {
        Ok = false;
        break;
      }
      Instruction *I = (Instruction *)V;
      Insts.push_back(I);
      Funcs.insert(I->getParent()->getParent());
    }
    if (!Ok) {
      continue;
    }

    unsigned K = getRandomNumber();
    Type *Ty = GV->getValueType();
    uint64_t Size = DL.getTypeAllocSize(Ty);
    if (Ty->isIntegerTy()) {
      ConstantInt *CI = (ConstantInt *)GV->getInitializer();
      uint64_t V = CI->getZExtValue();
      __obfu_globalenc_enc((uint8_t *)&V, (uint8_t *)&K, Size, KEY_LEN);
      GV->setInitializer(ConstantInt::get(Ty, V));
    } else if (Ty->isArrayTy()) {
      ArrayType *AT = (ArrayType *)Ty;
      Type *EleTy = AT->getArrayElementType();
      if (!EleTy->isIntegerTy()) {
        continue;
      }
      ConstantDataArray *CA = (ConstantDataArray *)GV->getInitializer();
      const char *Data = (const char *)CA->getRawDataValues().data();
      char *Tmp = new char[Size];
      memcpy(Tmp, Data, Size);
      __obfu_globalenc_enc((uint8_t *)Tmp, (uint8_t *)&K, Size, KEY_LEN);
      GV->setInitializer(ConstantDataArray::getRaw(StringRef((char *)Tmp, Size),
                                                   CA->getNumElements(),
                                                   CA->getElementType()));

    } else {
      continue;
    }

    std::map<Function *, Value *> FV;
    for (Function *F : Funcs) {
      IRBuilder<> IRB(&*F->getEntryBlock().getFirstInsertionPt());
      AllocaInst *Copy = IRB.CreateAlloca(Ty);
      Copy->setAlignment(Align(GV->getAlignment()));
      IRB.CreateMemCpy(Copy, (MaybeAlign)0, GV, (MaybeAlign)0,
                       IRB.getInt64(Size));
      AllocaInst *Key = IRB.CreateAlloca(IRB.getInt32Ty());
      IRB.CreateStore(IRB.getInt32(K), Key);
      IRB.CreateCall(FunctionCallee(DecFunc),
                     {
                         IRB.CreateBitOrPointerCast(Copy, IRB.getInt8PtrTy()),
                         IRB.CreateBitOrPointerCast(Key, IRB.getInt8PtrTy()),
                         IRB.getInt64(Size),
                         IRB.getInt64(KEY_LEN),
                     });
      FV[F] = Copy;
    }

    for (Instruction *I : Insts) {
      Function *F = I->getParent()->getParent();
      Value *C = FV[F];
      for (Use &U : I->operands()) {
        if (U.get() == GV) {
          U.set(C);
        }
      }
    }
  }
}
} // namespace polaris
