#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {
struct CustomCC : PassInfoMixin<CustomCC> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
  void FixInstrCallingConv(Module &M, Function &Target, CallingConv::ID CC);
  static bool isRequired() { return true; }
};

}; // namespace polaris