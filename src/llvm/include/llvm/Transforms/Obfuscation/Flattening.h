#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {

struct Flattening : PassInfoMixin<Flattening> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

  static bool isRequired() { return true; }
  void doFlatten(Function *f, int seed, Function *updateFunc);
  Function *buildUpdateKeyFunc(Module *m);
};

}; // namespace polaris