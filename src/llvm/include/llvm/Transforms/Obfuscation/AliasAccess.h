#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace polaris {
#define BRANCH_NUM 6
struct AliasAccess : PassInfoMixin<AliasAccess> {
  struct ElementPos {
    StructType *Type;
    unsigned Index;
  };
  struct ReferenceNode {
    AllocaInst *AI;
    bool IsRaw;
    unsigned Id;
    std::map<AllocaInst *, ElementPos> RawInsts;
    std::map<unsigned, ReferenceNode *> Edges;
    std::map<AllocaInst *, std::vector<unsigned>> Path;
  };

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
  Function *buildGetterFunction(Module &M, StructType *ST, unsigned Index);
  void process(Function &F);
  static bool isRequired() { return true; }
};

}; // namespace polaris