#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {

struct BogusControlFlow2 : PassInfoMixin<BogusControlFlow2> {

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);

  static bool isRequired() { return true; }
};

}; // namespace polaris
