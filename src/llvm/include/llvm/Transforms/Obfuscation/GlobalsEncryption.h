#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {

struct GlobalsEncryption : PassInfoMixin<GlobalsEncryption> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
  Function *buildDecryptFunction(Module &M);
  void process(Module &M);
  static bool isRequired() { return true; }
};

}; // namespace polaris