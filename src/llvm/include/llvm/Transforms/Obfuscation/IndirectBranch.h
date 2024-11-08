#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {
struct IndirectBlockInfo {
  BasicBlock *BB;
  unsigned IndexWithinTable;
  unsigned RandomKey;
};
struct IndirectBranch : PassInfoMixin<IndirectBranch> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
  void process(Function &F);
  static bool isRequired() { return true; }
};

}; // namespace polaris