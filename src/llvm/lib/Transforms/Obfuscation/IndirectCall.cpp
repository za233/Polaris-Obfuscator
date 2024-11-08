#include "llvm/Transforms/Obfuscation/IndirectCall.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Transforms/Obfuscation/Utils.h"

using namespace llvm;
namespace polaris {
PreservedAnalyses IndirectCall::run(Function &F, FunctionAnalysisManager &AM) {
  if (readAnnotate(F).find("indirectcall") != std::string::npos) {
    process(F);
    return PreservedAnalyses::none();
  }

  return PreservedAnalyses::all();
}
void IndirectCall::process(Function &F) {
  DataLayout Data = F.getParent()->getDataLayout();
  int PtrSize =
      Data.getTypeAllocSize(Type::getInt8Ty(F.getContext())->getPointerTo());
  Type *PtrValueType = Type::getIntNTy(F.getContext(), PtrSize * 8);
  std::vector<CallInst *> CIs;
  for (BasicBlock &BB : F) {
    for (Instruction &I : BB) {
      if (isa<CallInst>(I)) {
        CallInst *CI = (CallInst *)&I;
        Function *Func = CI->getCalledFunction();
        if (Func && Func->hasExactDefinition()) {
          CIs.push_back(CI);
        }
      }
    }
  }
  for (CallInst *CI : CIs) {
    Type *Ty = CI->getFunctionType()->getPointerTo();

    Constant *Func = (Constant *)CI->getCalledFunction();
    Constant *CValue = ConstantExpr::getPtrToInt(
        ConstantExpr::getBitCast(Func, Ty, false), PtrValueType, false);
    unsigned Mask = getRandomNumber();
    CValue = ConstantExpr::getAdd(CValue, ConstantInt::get(PtrValueType, Mask));
    CValue = ConstantExpr::getIntToPtr(
        CValue, Type::getInt8Ty(F.getContext())->getPointerTo());

    GlobalVariable *GV = new GlobalVariable(
        *(F.getParent()), Type::getInt8Ty(F.getContext())->getPointerTo(),
        false, GlobalValue::PrivateLinkage, NULL);
    IRBuilder<> IRB((Instruction *)CI);
    Value *MaskValue = IRB.getInt32(Mask);
    MaskValue = IRB.CreateZExt(MaskValue, PtrValueType);
    Value *CallPtr = IRB.CreateIntToPtr(
        IRB.CreateSub(IRB.CreatePtrToInt(IRB.CreateLoad(IRB.getInt8PtrTy(), GV),
                                         PtrValueType),
                      MaskValue),
        Ty);
    CI->setCalledFunction(CI->getFunctionType(), CallPtr);
    GV->setInitializer(CValue);
  }
}
} // namespace polaris