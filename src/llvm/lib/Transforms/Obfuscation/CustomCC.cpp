#include "llvm/Transforms/Obfuscation/CustomCC.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Transforms/Obfuscation/Utils.h"

using namespace llvm;
namespace polaris {
PreservedAnalyses CustomCC::run(Module &M, ModuleAnalysisManager &AM) {
  static const CallingConv::ID ObfuCCs[] = {
      CallingConv::Obfu1, CallingConv::Obfu2, CallingConv::Obfu3,
      CallingConv::Obfu4, CallingConv::Obfu5, CallingConv::Obfu6,
      CallingConv::Obfu7, CallingConv::Obfu8};
  for (Function &F : M) {
    if (readAnnotate(F).find("customcc") != std::string::npos) {
      errs() << F.getName() << '\n';
      CallingConv::ID CC = ObfuCCs[getRandomNumber() % std::size(ObfuCCs)];
      F.setCallingConv(CC);
      FixInstrCallingConv(M, F, CC);
    }
  }

  return PreservedAnalyses::none();
}
void CustomCC::FixInstrCallingConv(Module &M, Function &Target,
                                   CallingConv::ID CC) {
  std::vector<CallInst *> CIs;
  for (Function &F : M) {
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        if (isa<CallInst>(I)) {
          CallInst *CI = (CallInst *)&I;
          Function *Func = CI->getCalledFunction();
          if (Func && Func == &Target) {
            CIs.push_back(CI);
          }
        }
      }
    }
  }
  for (CallInst *CI : CIs) {
    CI->setCallingConv(CC);
  }
}
} // namespace polaris