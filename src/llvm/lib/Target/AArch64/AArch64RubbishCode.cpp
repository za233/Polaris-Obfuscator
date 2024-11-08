#include "AArch64.h"
#include "AArch64Subtarget.h"
#include "llvm/CodeGen/IndirectThunks.h"
#include "llvm/CodeGen/LivePhysRegs.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetMachine.h"
#include <cstdio>
#include <ctime>
#include <random>
#include <vector>
using namespace llvm;

#define DEBUG_TYPE "aarch64-obfuscation"

namespace {
class AArch64RubbishCodePass : public MachineFunctionPass {
public:
  static char ID;
  AArch64RubbishCodePass() : MachineFunctionPass(ID) {}
  StringRef getPassName() const override { return "AArch64 Obfuscation"; }

  bool runOnMachineFunction(MachineFunction &MF) override;
};
char AArch64RubbishCodePass::ID = 0;

bool AArch64RubbishCodePass::runOnMachineFunction(MachineFunction &MF) {
  return false;
}
INITIALIZE_PASS(AArch64RubbishCodePass, DEBUG_TYPE, DEBUG_TYPE, false, false)

FunctionPass *llvm::createAArch64RubbishCodePassPass() {
  return new AArch64RubbishCodePass();
}
} // namespace
