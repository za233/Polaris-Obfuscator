#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {

#define getRand32() (getRandomNumber() & 0xffffffff)
struct BogusControlFlow : PassInfoMixin<BogusControlFlow> {

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
  void splitBasicBlock(Function &F, unsigned Size);
  BasicBlock *cloneAlterBasicBlock(BasicBlock *BB);
  void process(Function &F);
  static bool isRequired() { return true; }
};

}; // namespace polaris