#include "llvm/Transforms/Obfuscation/IndirectBranch.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Transforms/Obfuscation/Utils.h"

using namespace llvm;
namespace polaris {

void IndirectBranch::process(Function &F) {
  DataLayout Data = F.getParent()->getDataLayout();
  int PtrSize =
      Data.getTypeAllocSize(Type::getInt8Ty(F.getContext())->getPointerTo());
  Type *PtrValueType = Type::getIntNTy(F.getContext(), PtrSize * 8);
  std::vector<BranchInst *> Brs;
  for (BasicBlock &BB : F) {
    for (Instruction &I : BB) {
      if (isa<BranchInst>(I)) {
        Brs.push_back((BranchInst *)&I);
      }
    }
  }

  std::map<BasicBlock *, IndirectBlockInfo> Map;
  std::vector<Constant *> Values;
  for (BranchInst *Br : Brs) {
    std::vector<BasicBlock *> BBs;
    if (Br->isConditional()) {
      BasicBlock *TrueBB = Br->getSuccessor(0), *FalseBB = Br->getSuccessor(1);
      BBs.push_back(TrueBB);
      BBs.push_back(FalseBB);
    } else {
      BasicBlock *BB = Br->getSuccessor(0);
      BBs.push_back(BB);
    }
    for (BasicBlock *BB : BBs) {
      if (Map.find(BB) != Map.end()) {
        continue;
      }
      IndirectBlockInfo Info;
      Info.BB = BB;
      Info.IndexWithinTable = Map.size();
      Info.RandomKey = 0;
      Map[BB] = Info;
      Values.push_back(nullptr);
    }
  }
  ArrayType *AT = ArrayType::get(
      Type::getInt8Ty(F.getContext())->getPointerTo(), Map.size());
  GlobalVariable *AddrTable = new GlobalVariable(
      *(F.getParent()), AT, false, GlobalValue::PrivateLinkage, NULL);
  for (auto Iter = Map.begin(); Iter != Map.end(); Iter++) {
    IndirectBlockInfo &Info = Iter->second;
    assert(Iter->first == Info.BB);
    BlockAddress *BA = BlockAddress::get(Info.BB);
    Constant *CValue = ConstantExpr::getPtrToInt(BA, PtrValueType);
    CValue = ConstantExpr::getAdd(
        CValue, ConstantInt::get(PtrValueType, Info.RandomKey));
    CValue = ConstantExpr::getIntToPtr(
        CValue, Type::getInt8Ty(F.getContext())->getPointerTo());
    Values[Info.IndexWithinTable] = CValue;
  }
  Constant *ValueArray = ConstantArray::get(AT, ArrayRef<Constant *>(Values));
  AddrTable->setInitializer(ValueArray);

  for (BranchInst *Br : Brs) {
    IRBuilder<> IRB(Br);
    if (Br->isConditional()) {
      BasicBlock *TrueBB = Br->getSuccessor(0), *FalseBB = Br->getSuccessor(1);
      IndirectBlockInfo &TI = Map[TrueBB], &FI = Map[FalseBB];
      Value *Cond = Br->getCondition();
      Value *Index = IRB.CreateSelect(Cond, IRB.getInt32(TI.IndexWithinTable),
                                      IRB.getInt32(FI.IndexWithinTable));
      Value *Item = IRB.CreateLoad(
          IRB.getInt8PtrTy(),
          IRB.CreateGEP(AT, AddrTable, {IRB.getInt32(0), Index}));

      Value *Key =
          IRB.CreateSelect(Cond, IRB.getIntN(PtrSize * 8, TI.RandomKey),
                           IRB.getIntN(PtrSize * 8, FI.RandomKey));
      Value *Addr = IRB.CreateIntToPtr(
          IRB.CreateSub(IRB.CreatePtrToInt(Item, PtrValueType), Key),
          IRB.getInt8PtrTy());

      IndirectBrInst *IBR = IRB.CreateIndirectBr(Addr);
      IBR->addDestination(TrueBB);
      IBR->addDestination(FalseBB);
      Br->eraseFromParent();
    } else {
      BasicBlock *BB = Br->getSuccessor(0);
      IndirectBlockInfo &BI = Map[BB];
      Value *Item = IRB.CreateLoad(
          IRB.getInt8PtrTy(),
          IRB.CreateGEP(AT, AddrTable,
                        {IRB.getInt32(0), IRB.getInt32(BI.IndexWithinTable)}));
      Value *Key = IRB.getIntN(PtrSize * 8, BI.RandomKey);
      Value *Addr = IRB.CreateIntToPtr(
          IRB.CreateSub(IRB.CreatePtrToInt(Item, PtrValueType), Key),
          IRB.getInt8PtrTy());
      IndirectBrInst *IBR = IRB.CreateIndirectBr(Addr);
      IBR->addDestination(BB);
      Br->eraseFromParent();
    }
  }
}
PreservedAnalyses IndirectBranch::run(Function &F,
                                      FunctionAnalysisManager &AM) {
  if (readAnnotate(F).find("indirectbr") != std::string::npos) {
    process(F);
    return PreservedAnalyses::none();
  }

  return PreservedAnalyses::all();
}
} // namespace polaris