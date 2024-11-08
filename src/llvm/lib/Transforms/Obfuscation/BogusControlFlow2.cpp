#include "llvm/Transforms/Obfuscation/BogusControlFlow2.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Obfuscation/Utils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <vector>

using namespace llvm;

namespace polaris {

BasicBlock *cloneBasicBlock(BasicBlock *BB) {
  ValueToValueMapTy VMap;
  BasicBlock *cloneBB = CloneBasicBlock(BB, VMap, "cloneBB", BB->getParent());
  BasicBlock::iterator origI = BB->begin();
  for (Instruction &I : *cloneBB) {
    for (int i = 0; i < I.getNumOperands(); i++) {
      Value *V = MapValue(I.getOperand(i), VMap);
      if (V) {
        I.setOperand(i, V);
      }
    }
    SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
    I.getAllMetadata(MDs);
    for (std::pair<unsigned, MDNode *> pair : MDs) {
      MDNode *MD = MapMetadata(pair.second, VMap);
      if (MD) {
        I.setMetadata(pair.first, MD);
      }
    }
    I.setDebugLoc(origI->getDebugLoc());
    origI++;
  }
  return cloneBB;
}

Value *createBogusCmp(BasicBlock *insertAfter) {
  // if((y < 10 || x * (x + 1) % 2 == 0))
  Module *M = insertAfter->getModule();
  LLVMContext &context = M->getContext();
  GlobalVariable *xptr = new GlobalVariable(
      *M, Type::getInt32Ty(context), false, GlobalValue::CommonLinkage,
      ConstantInt::get(Type::getInt32Ty(context), 0), "x");
  GlobalVariable *yptr = new GlobalVariable(
      *M, Type::getInt32Ty(context), false, GlobalValue::CommonLinkage,
      ConstantInt::get(Type::getInt32Ty(context), 0), "y");

  IRBuilder<> builder(context);
  builder.SetInsertPoint(insertAfter);
  LoadInst *x = builder.CreateLoad(Type::getInt32Ty(context), xptr);
  LoadInst *y = builder.CreateLoad(Type::getInt32Ty(context), yptr);
  Value *cond1 =
      builder.CreateICmpSLT(y, ConstantInt::get(Type::getInt32Ty(context), 10));
  Value *op1 =
      builder.CreateAdd(x, ConstantInt::get(Type::getInt32Ty(context), 1));
  Value *op2 = builder.CreateMul(op1, x);
  Value *op3 =
      builder.CreateURem(op2, ConstantInt::get(Type::getInt32Ty(context), 2));
  Value *cond2 =
      builder.CreateICmpEQ(op3, ConstantInt::get(Type::getInt32Ty(context), 0));
  return BinaryOperator::CreateOr(cond1, cond2, "", insertAfter);
}

PreservedAnalyses BogusControlFlow2::run(Function &F,
                                         FunctionAnalysisManager &AM) {

  if (readAnnotate(F).find("boguscfg") != std::string::npos) {
    std::vector<BasicBlock *> origBB;
    for (BasicBlock &BB : F) {
      origBB.push_back(&BB);
    }
    for (BasicBlock *BB : origBB) {
      if (isa<InvokeInst>(BB->getTerminator()) || BB->isEHPad()) {
        continue;
      }
      BasicBlock *headBB = BB;
      BasicBlock *bodyBB =
          BB->splitBasicBlock(BB->getFirstNonPHIOrDbgOrLifetime(), "bodyBB");
      BasicBlock *tailBB =
          bodyBB->splitBasicBlock(bodyBB->getTerminator(), "endBB");
      BasicBlock *cloneBB = cloneBasicBlock(bodyBB);

      BB->getTerminator()->eraseFromParent();
      bodyBB->getTerminator()->eraseFromParent();
      cloneBB->getTerminator()->eraseFromParent();

      Value *cond1 = createBogusCmp(BB);
      Value *cond2 = createBogusCmp(bodyBB);

      BranchInst::Create(bodyBB, cloneBB, cond1, BB);
      BranchInst::Create(tailBB, cloneBB, cond2, bodyBB);
      BranchInst::Create(bodyBB, cloneBB);
    }
    return PreservedAnalyses::none();
  }
  return PreservedAnalyses::all();
}

}; // namespace polaris
