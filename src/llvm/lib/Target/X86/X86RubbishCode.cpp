
#include "X86.h"
#include "X86InstrBuilder.h"
#include "X86Subtarget.h"
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
#include <cmath>
#include <cstdio>
#include <ctime>
#include <random>
#include <vector>
using namespace llvm;

#define DEBUG_TYPE "x86-obfuscation"

namespace {

struct ObfuscateInstrInfo {
  MachineInstr *RawInst;
  std::vector<MCPhysReg> AvailableRegs;
  bool EFlagsAvailable;
};

struct ObfuscateOption {
  bool InsertRubbishCode = false;
  bool SplitBasicBlock = false;
};
enum OperandsType {
  NoOpreand,
  OnlyReg,
  OnlyImm,
  RegReg,
  RegImm,
  MemReg,
  RegMem
};

class X86RubbishCodePass : public MachineFunctionPass {
public:
  static char ID;
  std::vector<std::string> Asm;
  std::map<MCSymbol *, MachineBasicBlock *> Syms;

  X86RubbishCodePass() : MachineFunctionPass(ID) {}

  StringRef getPassName() const override { return "X86 Obfuscation"; }

  bool runOnMachineFunction(MachineFunction &MF) override;

  void replaceInstruction(ObfuscateInstrInfo &OI);

  MachineInstr *insertDirtyBytes(MachineInstr *Before,
                                 std::vector<unsigned char> &Data);

  void generateRubbishCode(ObfuscateInstrInfo &OI, bool HasMemOperand);

  MachineBasicBlock *splitBasicBlock(MachineBasicBlock *MBB,
                                     MachineInstr *Header, MachineInstr *Tail,
                                     std::vector<MachineInstr *> &FixPoint);

  MCPhysReg getRegisterBySize(unsigned Size, std::vector<MCPhysReg> &Regs);

  bool getRegistersBySize(unsigned SizeInBits, std::vector<MCPhysReg> &Regs,
                          unsigned Num, std::vector<MCPhysReg> &Out);

  unsigned getRegisterSize(MCPhysReg Reg);

  bool buildMIWrapper(unsigned Opcode, ObfuscateInstrInfo &OII, OperandsType Ty,
                      std::vector<MCPhysReg> &Regs, unsigned Bits,
                      bool DefFlag);

  void insertNop(MachineFunction &MF);

  void randomMoveBasicBlock(MachineFunction &MF,
                            std::vector<MachineInstr *> &FixPoint);

  bool checkShouldProcess(MachineFunction &MF, ObfuscateOption &OO);

  void process(MachineFunction &MF, ObfuscateOption &OO);

  void generateObfuscateInfo(MachineFunction &MF,
                             std::vector<ObfuscateInstrInfo> &Items,
                             bool Debug);

  void generateObfuscateInfo(MachineBasicBlock &MBB,
                             std::vector<ObfuscateInstrInfo> &Items,
                             bool Debug);

  ObfuscateInstrInfo *findObfuscateInfo(MachineInstr *MI,
                                        std::vector<ObfuscateInstrInfo> &OIs);

  void insertNopInstruction(MachineBasicBlock &MBB, unsigned Num,
                            std::vector<MachineInstr *> &NopInstrs);

  bool replaceMOVri(ObfuscateInstrInfo &OI, uint64_t Value,
                    MCPhysReg ResultReg);

  bool replaceMOVrr(ObfuscateInstrInfo &OI, MCPhysReg FromReg, MCPhysReg ToReg);

  void replaceMemInst(ObfuscateInstrInfo &OI, uint64_t OperandIndex);

  void obfuscateControlFlow(MachineFunction &MF);

  void obfuscateDataFlow(MachineFunction &MF);

  void processBasicBlock(MachineBasicBlock &MBB, unsigned Times);

  void processCSR(MachineFunction &MF, std::vector<MachineInstr *> &Rets);

private:
  MachineRegisterInfo *MRI = nullptr;
  const X86InstrInfo *TII = nullptr;
  const TargetRegisterInfo *TRI = nullptr;
  MachineFrameInfo *MFI = nullptr;

  std::vector<MCPhysReg> RegList = {
      X86::AL,   X86::AX,   X86::EAX,  X86::RAX,  /*X86::BL,   X86::BX,
      X86::EBX,  X86::RBX,  */ X86::CL,
      X86::CX,   X86::ECX,  X86::RCX,  X86::DL,   X86::DX,
      X86::EDX,  X86::RDX,  X86::SIL,  X86::SI,   X86::ESI,
      X86::RSI,  X86::DIL,  X86::DI,   X86::EDI,  X86::RDI,
      X86::R8B,  X86::R8W,  X86::R8D,  X86::R8,   X86::R9B,
      X86::R9W,  X86::R9D,  X86::R9,   X86::R10B, X86::R10W,
      X86::R10D, X86::R10,  X86::R11B, X86::R11W, X86::R11D,
      X86::R11/*,  X86::R12B, X86::R12W, X86::R12D, X86::R12,
      X86::R13B, X86::R13W, X86::R13D, X86::R13,  X86::R14B,
      X86::R14W, X86::R14D, X86::R14,  X86::R15B, X86::R15W,
      X86::R15D, X86::R15*/};
};
} // end anonymous namespace

char X86RubbishCodePass ::ID = 0;

INITIALIZE_PASS(X86RubbishCodePass, DEBUG_TYPE, DEBUG_TYPE, false, false)

FunctionPass *llvm::createX86RubbishCodePassPass() {
  return new X86RubbishCodePass();
}
MachineInstr *
X86RubbishCodePass::insertDirtyBytes(MachineInstr *Before,
                                     std::vector<unsigned char> &Data) {
  MachineBasicBlock *MBB = Before->getParent();
  std::string AsmStr = ".byte ";
  char Hex[10] = {0};
  bool Tail = false;
  for (unsigned char d : Data) {
    if (Tail)
      AsmStr += ", ";
    sprintf(Hex, "0x%02x", d);
    AsmStr += std::string(Hex);

    Tail = true;
  }
  Asm.push_back(AsmStr);
  std::string &T = Asm.back();
  return BuildMI(*MBB, *Before, Before->getDebugLoc(), TII->get(X86::INLINEASM))
      .addExternalSymbol(T.c_str())
      .addImm(InlineAsm::Extra_HasSideEffects)
      .getInstr();
}
unsigned X86RubbishCodePass::getRegisterSize(MCPhysReg Reg) {
  const TargetRegisterClass *RC = TRI->getMinimalPhysRegClass(MCRegister(Reg));
  return TRI->getRegSizeInBits(*RC);
}
bool X86RubbishCodePass::replaceMOVrr(ObfuscateInstrInfo &OI, MCPhysReg FromReg,
                                      MCPhysReg ToReg) {
  MachineInstr *MI = OI.RawInst;
  MachineBasicBlock *MBB = MI->getParent();
  unsigned SizeInBits = getRegisterSize(FromReg);
  assert(SizeInBits == getRegisterSize(ToReg));
  unsigned PushOp, PopOp, MovOp;
  if (SizeInBits == 8) {
    MovOp = X86::MOV8rr;
  } else if (SizeInBits == 16) {
    MovOp = X86::MOV16rr;
    PushOp = X86::PUSH16r;
    PopOp = X86::POP16r;
  } else if (SizeInBits == 32) {
    MovOp = X86::MOV32rr;
    PushOp = X86::PUSH32r;
    PopOp = X86::POP32r;
  } else {
    MovOp = X86::MOV64rr;
    PushOp = X86::PUSH64r;
    PopOp = X86::POP64r;
  }

  MCPhysReg TempReg = getRegisterBySize(SizeInBits, OI.AvailableRegs);
  if (TempReg == X86::NoRegister) {
    return false;
  }
  BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(MovOp))
      .addReg(TempReg)
      .addReg(FromReg);
  BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(MovOp))
      .addReg(ToReg)
      .addReg(TempReg);

  return true;
}
bool X86RubbishCodePass::replaceMOVri(ObfuscateInstrInfo &OI, uint64_t Value,
                                      MCPhysReg ResultReg) {
  MachineInstr *MI = OI.RawInst;
  MachineBasicBlock *MBB = MI->getParent();
  unsigned C = rand() % 3;
  if (!OI.EFlagsAvailable) {
    C = 0;
  }
  unsigned SizeInBits = getRegisterSize(ResultReg);
  unsigned MovOp, AddOp, SubOp, XorOp;
  uint64_t MaskA = 0;
  if (SizeInBits == 8) {
    MovOp = X86::MOV8ri;
    XorOp = X86::XOR8ri;
    AddOp = X86::ADD8ri;
    SubOp = X86::SUB8ri;
    MaskA = rand() & 0xff;
  } else if (SizeInBits == 16) {
    MovOp = X86::MOV16ri;
    XorOp = X86::XOR16ri;
    AddOp = X86::ADD16ri;
    SubOp = X86::SUB16ri;
    MaskA = rand() & 0xffff;
  } else if (SizeInBits == 32) {
    MovOp = X86::MOV32ri;
    XorOp = X86::XOR32ri;
    AddOp = X86::ADD32ri;
    SubOp = X86::SUB32ri;
    MaskA = rand() & 0xffffffff;
  } else {
    assert(false);
  }
  unsigned Selection[] = {AddOp, SubOp, XorOp};

  uint64_t MaskB;

  if (Selection[C] == XorOp) {
    MaskB = MaskA ^ Value;
    if (rand() % 2) {
      std::swap(MaskA, MaskB);
    }
  } else if (Selection[C] == AddOp) {
    MaskB = Value - MaskA;
    if (rand() % 2) {
      std::swap(MaskA, MaskB);
    }
  } else if (Selection[C] == SubOp) {
    MaskB = MaskA - Value;
  }
  BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(MovOp))
      .addReg(ResultReg)
      .addImm(MaskA);
  BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(Selection[C]))
      .addDef(ResultReg)
      .addReg(ResultReg)
      .addImm(MaskB);
  return true;
}
uint64_t div2(uint64_t Value) {
  uint64_t r = 1;
  while ((Value & 1) != 1) {
    Value >>= 1;
    r++;
  }
  return r;
}
void X86RubbishCodePass::replaceMemInst(ObfuscateInstrInfo &OI,
                                        uint64_t OperandIndex) {
  // mov [rsp + 4 * rax + 8], rcx
  MachineInstr *MI = OI.RawInst;
  MachineBasicBlock *MBB = MI->getParent();
  if (!MI->getOperand(0 + OperandIndex).isReg() ||
      !MI->getOperand(1 + OperandIndex).isImm() ||
      !MI->getOperand(2 + OperandIndex).isReg() ||
      !MI->getOperand(3 + OperandIndex).isImm() ||
      !MI->getOperand(4 + OperandIndex).isReg()) {
    return;
  }

  if (MI->getOperand(4 + OperandIndex).getReg() != X86::NoRegister ||
      !OI.EFlagsAvailable) {
    return;
  }
  std::vector<MCPhysReg> TempRegs;
  if (!getRegistersBySize(64, OI.AvailableRegs, 2, TempRegs)) {
    return;
  }
  MCPhysReg TempReg = TempRegs[0];
  MCPhysReg BaseReg = MI->getOperand(0 + OperandIndex).getReg();
  uint64_t Step = MI->getOperand(1 + OperandIndex).getImm();

  if (Step != 1 && Step != 2 && Step != 4 && Step != 8) {
    return;
  }
  unsigned BitShift = div2(Step);
  MCPhysReg OffsetReg = MI->getOperand(2 + OperandIndex).getReg();
  int64_t Offset = MI->getOperand(3 + OperandIndex).getImm(),
          Mask = rand() % 100;
  if (rand() % 2) {
    Mask = -Mask;
  }
  if (OffsetReg != X86::NoRegister) {
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::MOV64rr))
        .addReg(TempReg)
        .addReg(OffsetReg);
    if (BitShift > 1) {
      BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::SHL64ri))
          .addDef(TempReg)
          .addReg(TempReg)
          .addImm(BitShift - 1);
    }

  } else {
    if (rand() % 2) {
      BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::MOV64ri))
          .addReg(TempReg)
          .addImm(0);
    } else {

      BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::XOR64rr))
          .addDef(TempReg)
          .addReg(TempReg)
          .addReg(TempReg);
    }
  }

  if (Mask > 0) {
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::ADD64ri8))
        .addDef(TempReg)
        .addReg(TempReg)
        .addImm(Mask);
  } else {
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::SUB64ri8))
        .addDef(TempReg)
        .addReg(TempReg)
        .addImm(-Mask);
  }
  MCPhysReg TempReg2 = TempRegs[1];
  if (rand() % 2) {

    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::MOV64rr))
        .addReg(TempReg2)
        .addReg(BaseReg);
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::NEG64r))
        .addDef(TempReg2)
        .addReg(TempReg2);
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::SUB64rr))
        .addDef(TempReg)
        .addReg(TempReg)
        .addReg(TempReg2);
  } else {
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::MOV64rr))
        .addReg(TempReg2)
        .addReg(BaseReg);
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::ADD64rr))
        .addDef(TempReg)
        .addReg(TempReg)
        .addReg(TempReg2);
  }
  if (Offset > 0) {
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::ADD64ri32))
        .addDef(TempReg)
        .addReg(TempReg)
        .addImm(Offset);
  } else {
    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::SUB64ri32))
        .addDef(TempReg)
        .addReg(TempReg)
        .addImm(-Offset);
  }
  // MI->print(llvm::errs(), 0);
  MI->getOperand(0 + OperandIndex).setReg(TempReg);
  MI->getOperand(1 + OperandIndex).setImm(1);
  MI->getOperand(2 + OperandIndex).setReg(X86::NoRegister);
  MI->getOperand(3 + OperandIndex).setImm(-Mask);
  // MI->print(llvm::errs(), 0)X86RubbishCodePass::replaceMemInst
}
void X86RubbishCodePass::replaceInstruction(ObfuscateInstrInfo &OI) {
  if (!OI.EFlagsAvailable) {
    return;
  }
  MachineInstr *MI = OI.RawInst;
  MachineBasicBlock *MBB = MI->getParent();
  unsigned Opcode = MI->getOpcode();
  MCPhysReg Reg, FromReg, ToReg;
  int64_t Imm;
  std::vector<std::pair<unsigned, std::vector<unsigned>>> MemOpReplace = {
      {0,
       {X86::MOV8mr, X86::MOV8mi, X86::MOV16mr, X86::MOV16mi, X86::MOV32mr,
        X86::MOV32mi, X86::MOV64mr, X86::MOV64mi32, X86::ADD64mi32}},
      {1,
       {X86::MOV8rm, X86::MOV16rm, X86::MOV32rm, X86::MOVZX16rm16,
        X86::MOVZX16rm8, X86::MOVZX32rm16, X86::MOVZX32rm8, X86::MOVZX64rm16,
        X86::MOVZX64rm8, X86::MOVSX16rm16, X86::MOVSX16rm8, X86::MOVSX32rm16,
        X86::MOVSX32rm8, X86::MOVSX64rm16, X86::MOVSX64rm8, X86::MOV64rm}}};
  switch (Opcode) {
  case X86::PUSH64r:
    Reg = MI->getOperand(0).getReg();

    BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::MOV64mr))
        .addReg(X86::RSP)
        .addImm(1)
        .addReg(X86::NoRegister)
        .addImm(-8)
        .addReg(X86::NoRegister)
        .addReg(Reg);
    if (rand() % 2 == 1) {
      BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::SUB64ri8))
          .addDef(X86::RSP)
          .addReg(X86::RSP)
          .addImm(8);
    } else {
      if (rand() % 2) {
        BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::ADD64ri8))
            .addDef(X86::RSP)
            .addReg(X86::RSP)
            .addImm(-8);
      } else {
        BuildMI(*MBB, *MI, MI->getDebugLoc(), TII->get(X86::SUB64ri8))
            .addDef(X86::RSP)
            .addReg(X86::RSP)
            .addImm(8);
      }
    }
    MI->eraseFromParent();
    break;
  case X86::MOV8ri:
  case X86::MOV16ri:
  case X86::MOV32ri:
    Reg = MI->getOperand(0).getReg();
    Imm = MI->getOperand(1).getImm();
    if (replaceMOVri(OI, Imm, Reg)) {
      MI->eraseFromParent();
    }

    break;

  case X86::MOV8rr:
  case X86::MOV16rr:
  case X86::MOV32rr:
  case X86::MOV64rr:
    ToReg = MI->getOperand(0).getReg();
    FromReg = MI->getOperand(1).getReg();
    if (replaceMOVrr(OI, FromReg, ToReg)) {
      MI->eraseFromParent();
    }

    break;
  }
  for (auto Iter = MemOpReplace.begin(); Iter != MemOpReplace.end(); Iter++) {
    unsigned Index = Iter->first;
    for (auto It = Iter->second.begin(); It != Iter->second.end(); It++) {
      unsigned Op = *It;
      if (Op == MI->getOpcode()) {

        replaceMemInst(OI, Index);
      }
    }
  }
}
MCPhysReg X86RubbishCodePass::getRegisterBySize(unsigned SizeInBits,
                                                std::vector<MCPhysReg> &Regs) {
  std::vector<MCPhysReg> Available;
  for (MCPhysReg Reg : Regs) {
    if (getRegisterSize(Reg) == SizeInBits) {
      Available.push_back(Reg);
    }
  }
  if (Available.size() == 0)
    return X86::NoRegister;
  return Available[rand() % Available.size()];
}
bool X86RubbishCodePass::getRegistersBySize(unsigned SizeInBits,
                                            std::vector<MCPhysReg> &Regs,
                                            unsigned Num,
                                            std::vector<MCPhysReg> &Out) {
  for (unsigned i = 0; i < Num; i++) {
    std::vector<MCPhysReg> Available;
    for (MCPhysReg Reg : Regs) {
      if (getRegisterSize(Reg) == SizeInBits &&
          std::find(Out.begin(), Out.end(), Reg) == Out.end()) {
        Available.push_back(Reg);
      }
    }
    if (Available.size() == 0)
      return false;
    Out.push_back(Available[rand() % Available.size()]);
  }
  return true;
}
bool X86RubbishCodePass::buildMIWrapper(unsigned Opcode,
                                        ObfuscateInstrInfo &OII,
                                        OperandsType Ty,
                                        std::vector<MCPhysReg> &Regs,
                                        unsigned Bits, bool DefFlag) {
  MachineInstr *Ptr = OII.RawInst;
  MachineBasicBlock *MBB = Ptr->getParent();
  MachineInstr *Gen = nullptr;
  if (Ty == OperandsType::NoOpreand) {
    // printf("OperandsType::NoOpreand\n");
    Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode)).getInstr();
    // Gen->print(llvm::errs());
    return true;
  } else if (Ty == OperandsType::RegReg) {
    // printf("OperandsType::RegReg\n");
    MCPhysReg Reg0 = getRegisterBySize(Bits, Regs);
    MCPhysReg Reg1 = getRegisterBySize(Bits, Regs);
    if (Reg0 == X86::NoRegister || Reg1 == X86::NoRegister) {
      return false;
    }
    if (DefFlag) {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addDef(Reg0)
                .addReg(Reg0)
                .addReg(Reg1)
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    } else {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addReg(Reg0)
                .addReg(Reg1)
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    }

  } else if (Ty == OperandsType::RegImm) {
    // printf("OperandsType::RegImm\n");
    MCPhysReg Reg0 = getRegisterBySize(Bits, Regs);
    if (Reg0 == X86::NoRegister) {
      return false;
    }
    if (DefFlag) {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addDef(Reg0)
                .addReg(Reg0)
                .addImm(rand())
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    } else {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addReg(Reg0)
                .addImm(rand())
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    }

  } else if (Ty == OperandsType::MemReg) {
    // printf("OperandsType::MemReg\n");
    uint64_t StackSize = MFI->getStackSize();
    MCPhysReg Reg0 = getRegisterBySize(Bits, Regs);
    if (Reg0 == X86::NoRegister) {
      return false;
    }
    if (StackSize == 0)
      StackSize = 1;
    int64_t Offset = rand() % StackSize; // ???
    Offset &= 0xfffffffffffffffe;
    Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
              .addReg(X86::RSP)
              .addImm(1)
              .addReg(X86::NoRegister)
              .addImm(Offset)
              .addReg(X86::NoRegister)
              .addReg(Reg0)
              .getInstr();
    // Gen->print(llvm::errs());
    return true;
  } else if (Ty == OperandsType::RegMem) {
    // printf("OperandsType::RegMem\n");
    uint64_t StackSize = MFI->getStackSize();
    MCPhysReg Reg0 = getRegisterBySize(Bits, Regs);
    if (Reg0 == X86::NoRegister) {
      return false;
    }
    if (StackSize == 0)
      StackSize = 1;
    int64_t Offset = rand() % StackSize;
    Offset &= 0xfffffffffffffffe;
    if (DefFlag) {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addDef(Reg0)
                .addReg(Reg0)
                .addReg(X86::RSP)
                .addImm(1)
                .addReg(X86::NoRegister)
                .addImm(Offset)
                .addReg(X86::NoRegister)
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    } else {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addReg(Reg0)
                .addReg(X86::RSP)
                .addImm(1)
                .addReg(X86::NoRegister)
                .addImm(Offset)
                .addReg(X86::NoRegister)
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    }
  } else if (Ty == OperandsType::OnlyReg) {
    // printf("OperandsType::OnlyReg\n");
    MCPhysReg Reg0 = getRegisterBySize(Bits, Regs);
    if (Reg0 == X86::NoRegister) {
      return false;
    }
    if (DefFlag) {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addDef(Reg0)
                .addReg(Reg0)
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    } else {
      Gen = BuildMI(*MBB, *Ptr, Ptr->getDebugLoc(), TII->get(Opcode))
                .addReg(Reg0)
                .getInstr();
      // Gen->print(llvm::errs());
      return true;
    }
  }
  return false;
}
void X86RubbishCodePass::randomMoveBasicBlock(
    MachineFunction &MF, std::vector<MachineInstr *> &FixPoint) {
  std::vector<MachineBasicBlock *> WorkList, MoveList;
  for (MachineBasicBlock &MBB : MF) {
    WorkList.push_back(&MBB);
  }
  for (MachineBasicBlock *MBB : WorkList) {
    MachineBasicBlock *CurBB = MBB;
    unsigned Counter = 0;
    MachineBasicBlock::iterator Iter = CurBB->begin();
    while (Iter != CurBB->end() && Iter != CurBB->getFirstTerminator()) {
      if (Counter > 6 && std::find(FixPoint.begin(), FixPoint.end(), &*Iter) ==
                             FixPoint.end()) {
        MachineBasicBlock *NewBB = CurBB->splitAt(*Iter, true, nullptr);
        if (NewBB == CurBB) {
          break;
        }
        // NewBB->print(errs(), 0);
        BuildMI(*CurBB, CurBB->end(), nullptr, TII->get(X86::JMP_4))
            .addMBB(NewBB);

        if (NewBB->getFirstTerminator() != NewBB->end()) {
          MachineInstr &MI = *NewBB->getFirstTerminator();
          if (MI.isUnconditionalBranch()) {
            MoveList.push_back(NewBB);
          }
        }
        CurBB = NewBB;
        Iter = CurBB->begin();
        Counter = 0;
      } else {
        Iter++, Counter++;
      }
    }
  }

  for (MachineBasicBlock *MBB : MoveList) {
    if (MBB == &MF.front()) {
      continue;
    }
    MachineBasicBlock *Before = MoveList[rand() % MoveList.size()];
    if (Before != MBB) {
      MBB->moveBefore(Before);
    }
  }
}
MachineBasicBlock *
X86RubbishCodePass::splitBasicBlock(MachineBasicBlock *MBB,
                                    MachineInstr *Header, MachineInstr *Tail,
                                    std::vector<MachineInstr *> &FixPoint) {

  if (Header->getParent() != MBB || Header->getParent() != Tail->getParent()) {
    printf("Split point not in the same basic block.\n");
    return nullptr;
  }
  MachineBasicBlock::iterator SplitPoint(Header);
  MachineBasicBlock::iterator EndPoint(Tail);
  bool Available = false;
  while (SplitPoint != MBB->end()) {
    if (SplitPoint == EndPoint) {
      Available = true;
      break;
    }
    SplitPoint++;
  }
  if (!Available || ++EndPoint == MBB->end()) {
    printf("Invalid split point\n");
    return nullptr;
  }
  MachineInstr *Point1 = Header, *Point2 = Tail;
  MachineFunction *MF = MBB->getParent();
  if (Header == Tail) {
    MachineBasicBlock::iterator It(Header);
    MachineInstr &NextInstr = *++It;
    Point2 =
        BuildMI(*MBB, NextInstr, NextInstr.getDebugLoc(), TII->get(X86::NOOP))
            .getInstr();
  }

  MachineBasicBlock *Body = MBB->splitAt(*Point1, true, nullptr);

  MachineBasicBlock *End = Body->splitAt(*Point2, true, nullptr);

  if (rand() % 10 > 11) {
    BuildMI(*MBB, MBB->end(), nullptr, TII->get(X86::JMP_4)).addMBB(Body);
    BuildMI(*Body, Body->end(), nullptr, TII->get(X86::JMP_4)).addMBB(End);
  } else {
    uint64_t StackSize = MFI->estimateStackSize(*MF);
    MachineInstr *StackPush =
        BuildMI(*MBB, MBB->end(), nullptr, TII->get(X86::SUB64ri32))
            .addDef(X86::RSP)
            .addReg(X86::RSP)
            .addImm(StackSize)
            .getInstr();
    FixPoint.push_back(StackPush);
    FixPoint.push_back(
        BuildMI(*MBB, MBB->end(), nullptr, TII->get(X86::CALL64pcrel32))
            .addMBB(Body)
            .getInstr());

    MachineInstr *MI = &*End->begin();
    unsigned RubbishSize = rand() % 30 + 20;

    BuildMI(*Body, Body->begin(), nullptr, TII->get(X86::ADD64mi32))
        .addReg(X86::RSP)
        .addImm(1)
        .addReg(X86::NoRegister)
        .addImm(0)
        .addReg(X86::NoRegister)
        .addImm(RubbishSize);
    BuildMI(*Body, Body->end(), nullptr, TII->get(X86::RET64));
    std::vector<unsigned char> RandBytes;
    for (unsigned i = 0; i < RubbishSize; i++) {
      RandBytes.push_back(rand() & 0xff);
    }
    FixPoint.push_back(insertDirtyBytes(MI, RandBytes));
    MachineInstr *StackPop =
        BuildMI(*End, MI, nullptr, TII->get(X86::ADD64ri32))
            .addDef(X86::RSP)
            .addReg(X86::RSP)
            .addImm(StackSize)
            .getInstr();
    FixPoint.push_back(StackPop);
  }

  Body->moveBefore(&*MF->end());

  if (Header == Tail) {
    Point2->eraseFromParent();
  }
  // MBB->print(llvm::errs(), 0);
  // Body->print(llvm::errs(), 0);
  // End->print(llvm::errs(), 0);
  // std::vector<ObfuscateInstrInfo> Items;
  // generateObfuscateInfo(*Body, Items, true);

  return Body;
}

void X86RubbishCodePass::insertNopInstruction(
    MachineBasicBlock &MBB, unsigned Num,
    std::vector<MachineInstr *> &NopInstrs) {
  while (Num--) {
    for (MachineInstr &MI : MBB) {
      MachineInstr *Nop =
          BuildMI(MBB, MI, MI.getDebugLoc(), TII->get(X86::NOOP)).getInstr();
      NopInstrs.push_back(Nop);
    }
  }
}
ObfuscateInstrInfo *
X86RubbishCodePass::findObfuscateInfo(MachineInstr *MI,
                                      std::vector<ObfuscateInstrInfo> &OIs) {
  for (auto Iter = OIs.begin(); Iter != OIs.end(); Iter++) {
    MachineInstr *RawInst = Iter->RawInst;
    if (RawInst == MI) {
      return &*Iter;
    }
  }
  return nullptr;
}
void X86RubbishCodePass::processBasicBlock(MachineBasicBlock &MBB,
                                           unsigned Times) {
  std::vector<ObfuscateInstrInfo> Items;
  for (unsigned i = 0; i < Times; i++) {
    generateObfuscateInfo(MBB, Items, false);
    for (ObfuscateInstrInfo &OI : Items) {
      replaceInstruction(OI);
    }
    Items.clear();
    generateObfuscateInfo(MBB, Items, false);
    for (ObfuscateInstrInfo &OI : Items) {
      if (OI.RawInst->getOpcode() == X86::INLINEASM) {
        continue;
      }
      generateRubbishCode(OI, true);
    }
    Items.clear();
  }
}
void X86RubbishCodePass::obfuscateDataFlow(MachineFunction &MF) {
  for (MachineBasicBlock &MBB : MF) {
    processBasicBlock(MBB, 1);
  }
}
void X86RubbishCodePass::obfuscateControlFlow(MachineFunction &MF) {

  std::vector<MachineBasicBlock *> WorkList;
  std::vector<MachineBasicBlock *> AvailableBlocks;
  std::vector<MachineInstr *> Nops, FixPoint;
  randomMoveBasicBlock(MF, FixPoint);
  for (MachineBasicBlock &MBB : MF) {
    insertNopInstruction(MBB, 1, Nops);
    WorkList.push_back(&MBB);
  }
  unsigned Times = 1, BlockSize = 4;
  std::vector<MachineInstr *> Instrs; // need opt...
  std::vector<ObfuscateInstrInfo> OIs;
  while (Times-- > 0) {
    std::vector<MachineBasicBlock *> IterList(WorkList);
    WorkList.clear();
    for (MachineBasicBlock *MBB : IterList) {
      Instrs.clear(), OIs.clear();
      generateObfuscateInfo(*MBB, OIs, false);
      MachineBasicBlock::iterator Ptr = MBB->begin(),
                                  FrameSetupInstr = MBB->begin(),
                                  FrameDestroyInstr = MBB->end();
      while (Ptr != MBB->end()) {

        if ((*Ptr).getFlag(MachineInstr::FrameSetup)) {
          Ptr++;
          FrameSetupInstr = Ptr;
        } else if ((*Ptr).getFlag(MachineInstr::FrameDestroy)) {
          Ptr--;
          FrameDestroyInstr = Ptr;
          break;
        } else {
          Ptr++;
        }
      }
      Ptr = FrameSetupInstr;
      while (Ptr != FrameDestroyInstr && Ptr != MBB->end()) {
        Instrs.push_back(&*Ptr);
        Ptr++;
      }

      if (Instrs.size() < 4) {
        continue;
      }
      unsigned State = 0, Reset = 1, ShouldSplit = 0;
      std::vector<MachineInstr *>::iterator Iter = Instrs.begin(),
                                            Bound = --Instrs.end(), Last;
      Iter++, Bound--;
      Last = Iter;
      std::vector<std::pair<MachineInstr *, MachineInstr *>> SplitPoints;
      while (Iter++ != Bound) {

        std::vector<MachineInstr *>::iterator TempIter = Iter;
        ++TempIter;
        ObfuscateInstrInfo *OI = findObfuscateInfo(*TempIter, OIs);
        if ((*Iter)->readsRegister(X86::RSP, TRI) ||
            (*Iter)->killsRegister(X86::RSP, TRI) ||
            (*Iter)->definesRegister(X86::RSP, TRI) ||
            (*Iter)->modifiesRegister(X86::RSP, TRI) || !OI->EFlagsAvailable) {
          Reset = 1;
        } else {
          if (Reset) {
            Last = Iter;
            State = 0;
          }
          Reset = 0;
          if (State == BlockSize - 1) {
            ShouldSplit ^= 1;
            if (ShouldSplit) {
              SplitPoints.push_back(std::make_pair(*Last, *Iter));
            }
            Last = Iter;
          }
          State = (State + 1) % BlockSize;
        }
      }

      for (auto P = SplitPoints.begin(); P != SplitPoints.end(); P++) {

        MachineBasicBlock *NewBlock = splitBasicBlock(
            P->first->getParent(), P->first, P->second, FixPoint);

        if (NewBlock) {
          MachineBasicBlock::iterator Ptr = NewBlock->begin(),
                                      InsertEnd = NewBlock->end();
          Ptr++, InsertEnd--;
          while (Ptr++ != InsertEnd) {
            for (unsigned i = 0; i < 2; i++) {
              MachineInstr *Nop = BuildMI(*NewBlock, *Ptr, Ptr->getDebugLoc(),
                                          TII->get(X86::NOOP))
                                      .getInstr();
              Nops.push_back(Nop);
            }
          }
          WorkList.push_back(NewBlock);

          AvailableBlocks.clear();
          for (MachineBasicBlock &MBB : MF) {
            if (&MBB == &MF.front() ||
                std::find(WorkList.begin(), WorkList.end(), &MBB) !=
                    WorkList.end() ||
                MBB.size() < 4) {
              continue;
            }
            AvailableBlocks.push_back(&MBB);
          }
          if (AvailableBlocks.size() != 0) {
            MachineBasicBlock *InsertInto =
                AvailableBlocks[rand() % AvailableBlocks.size()];
            unsigned InsertPos = InsertInto->size() / 2;

            for (MachineInstr &MI : *InsertInto) {
              InsertPos--;
              if (std::find(FixPoint.begin(), FixPoint.end(), &MI) !=
                  FixPoint.end()) {
                continue;
              }
              if (InsertPos <= 0) {
                MachineBasicBlock *InsertBefore =
                    InsertInto->splitAt(MI, true, nullptr);
                BuildMI(*InsertInto, InsertInto->end(), nullptr,
                        TII->get(X86::JMP_4))
                    .addMBB(InsertBefore);
                NewBlock->moveBefore(InsertBefore);
                break;
              }
            }
          }
        }
      }
    }
  }
  for (MachineInstr *Nop : Nops) {
    Nop->eraseFromParent();
  }
}
void X86RubbishCodePass::generateRubbishCode(ObfuscateInstrInfo &OI,
                                             bool HasMemOperand) {
  MachineInstr *Ptr = OI.RawInst;
  // printf("rubbish code process:\n");
  // Ptr->print(llvm::errs());
  MachineBasicBlock *MBB = Ptr->getParent();
  MachineFunction *MF = MBB->getParent();
  std::vector<MCPhysReg> &AvailableRegs = OI.AvailableRegs;
  std::vector<MCPhysReg> CommonRegs(RegList.begin(), --RegList.end());
  std::vector<unsigned> MemOpcodes = {
      X86::ADD8rm,  X86::ADC8rm,   X86::SUB8rm,  X86::SBB8rm,   X86::OR8rm,
      X86::XOR8rm,  X86::AND8rm,   X86::ADD16rm, X86::ADC16rm,  X86::SUB16rm,
      X86::SBB16rm, X86::OR16rm,   X86::XOR16rm, X86::AND16rm,  X86::ADD32rm,
      X86::ADC32rm, X86::SUB32rm,  X86::SBB32rm, X86::OR32rm,   X86::XOR32rm,
      X86::AND32rm, X86::ADD64rm,  X86::ADC64rm, X86::SUB64rm,  X86::SBB64rm,
      X86::OR64rm,  X86::XOR64rm,  X86::AND64rm, X86::MOV8rm,   X86::MOV16rm,
      X86::MOV32rm, X86::MOV64rm,  X86::TEST8mr, X86::CMP8mr,   X86::TEST16mr,
      X86::CMP16mr, X86::TEST32mr, X86::CMP32mr, X86::TEST64mr, X86::CMP64mr,
  };
  std::vector<unsigned> Opcodes = {

      X86::ADD8rr,      X86::ADC8rr,      X86::SUB8rr,      X86::SBB8rr,
      X86::OR8rr,       X86::XOR8rr,      X86::AND8rr,      X86::ADD16rr,
      X86::ADC16rr,     X86::SUB16rr,     X86::SBB16rr,     X86::OR16rr,
      X86::XOR16rr,     X86::AND16rr,     X86::ADD32rr,     X86::ADC32rr,
      X86::SUB32rr,     X86::SBB32rr,     X86::OR32rr,      X86::XOR32rr,
      X86::AND32rr,     X86::ADD64rr,     X86::ADC64rr,     X86::SUB64rr,
      X86::SBB64rr,     X86::OR64rr,      X86::XOR64rr,     X86::AND64rr,

      X86::STC,         X86::CLC,         X86::CMC,         X86::CLD,
      X86::STD,         X86::SAHF,        X86::LAHF,        X86::TEST8rr,
      X86::TEST16rr,    X86::TEST32rr,    X86::TEST64rr,    X86::CMP8rr,
      X86::CMP16rr,     X86::CMP32rr,     X86::CMP64rr,     X86::TEST8ri,
      X86::TEST16ri,    X86::TEST32ri,    X86::TEST64ri32,  X86::CMP8ri,
      X86::CMP16ri,     X86::CMP32ri,     X86::CMP64ri32,

      X86::ADD8ri,      X86::ADC8ri,      X86::SUB8ri,      X86::SBB8ri,
      X86::OR8ri,       X86::XOR8ri,      X86::AND8ri,      X86::ADD16ri,
      X86::ADC16ri,     X86::SUB16ri,     X86::SBB16ri,     X86::OR16ri,
      X86::XOR16ri,     X86::AND16ri,     X86::ADD32ri,     X86::ADC32ri,
      X86::SUB32ri,     X86::SBB32ri,     X86::OR32ri,      X86::XOR32ri,
      X86::AND32ri,     X86::ADD64ri32,   X86::ADC64ri32,   X86::SUB64ri32,
      X86::SBB64ri32,   X86::OR64ri32,    X86::XOR64ri32,   X86::AND64ri32,

      X86::SHL8ri,      X86::SHL16ri,     X86::SHL32ri,     X86::SHL64ri,
      X86::SHR8ri,      X86::SHR16ri,     X86::SHR32ri,     X86::SHR64ri,

      X86::MOV8rr,      X86::MOV16rr,     X86::MOV32rr,     X86::MOV64rr,
      X86::MOV8ri,      X86::MOV16ri,     X86::MOV32ri,     X86::MOV64ri32,
      X86::MOVSX16rr16, X86::MOVSX32rr32, X86::MOVZX16rr16,

      X86::LEA16r,      X86::LEA32r,      X86::LEA64r,      X86::INC8r,
      X86::INC16r,      X86::INC32r,      X86::INC64r,      X86::DEC8r,
      X86::DEC16r,      X86::DEC32r,      X86::DEC64r,      X86::RDRAND16r,
      X86::RDRAND32r,   X86::RDRAND64r,   X86::IMUL8r,      X86::IMUL16r,
      X86::IMUL32r,     X86::IMUL64r,     X86::NOT8r,       X86::NOT16r,
      X86::NOT32r,      X86::NOT64r,      X86::NEG8r,       X86::NEG16r,
      X86::NEG32r,      X86::NEG64r};
  if (HasMemOperand) {
    for (auto Iter = MemOpcodes.begin(); Iter != MemOpcodes.end(); Iter++) {
      Opcodes.push_back(*Iter);
    }
  }
  uint64_t Index = (((uint64_t)rand()) << 32) | ((uint64_t)rand());

  unsigned Opcode = Opcodes[Index % Opcodes.size()];

  switch (Opcode) {
  case X86::STC:
  case X86::CLC:
  case X86::CMC:
  case X86::CLD:
  case X86::SAHF:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, NoOpreand, CommonRegs, 0, false);
    }
    break;
  case X86::LAHF:
    if (OI.EFlagsAvailable &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::AH) !=
            AvailableRegs.end()) {
      buildMIWrapper(Opcode, OI, NoOpreand, CommonRegs, 0, false);
    }
    break;
  case X86::TEST8rr:
  case X86::CMP8rr:
    if (OI.EFlagsAvailable) {

      buildMIWrapper(Opcode, OI, RegReg, CommonRegs, 8, false);
    }
    break;
  case X86::TEST16rr:
  case X86::CMP16rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, CommonRegs, 16, false);
    }
    break;
  case X86::TEST32rr:
  case X86::CMP32rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, CommonRegs, 32, false);
    }
    break;
  case X86::TEST64rr:
  case X86::CMP64rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, CommonRegs, 64, false);
    }
    break;

  case X86::TEST8ri:
  case X86::CMP8ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, CommonRegs, 8, false);
    }
    break;

  case X86::TEST16ri:
  case X86::CMP16ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, CommonRegs, 16, false);
    }
    break;

  case X86::TEST32ri:
  case X86::CMP32ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, CommonRegs, 32, false);
    }
    break;
  case X86::TEST64ri32:
  case X86::CMP64ri32:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, CommonRegs, 64, false);
    }
    break;

  case X86::TEST8mr:
  case X86::CMP8mr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, MemReg, CommonRegs, 8, false);
    }
    break;

  case X86::TEST16mr:
  case X86::CMP16mr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, MemReg, CommonRegs, 16, false);
    }
    break;
  case X86::TEST32mr:
  case X86::CMP32mr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, MemReg, CommonRegs, 32, false);
    }
    break;
  case X86::TEST64mr:
  case X86::CMP64mr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, MemReg, CommonRegs, 64, false);
    }
    break;
  case X86::ADD8rr:
  case X86::ADC8rr:
  case X86::SUB8rr:
  case X86::SBB8rr:
  case X86::OR8rr:
  case X86::XOR8rr:
  case X86::AND8rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 8, true);
    }
    break;

  case X86::ADD16rr:
  case X86::ADC16rr:
  case X86::SUB16rr:
  case X86::SBB16rr:
  case X86::OR16rr:
  case X86::XOR16rr:
  case X86::AND16rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 16, true);
    }
    break;
  case X86::ADD32rr:
  case X86::ADC32rr:
  case X86::SUB32rr:
  case X86::SBB32rr:
  case X86::OR32rr:
  case X86::XOR32rr:
  case X86::AND32rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 32, true);
    }
    break;
  case X86::ADD64rr:
  case X86::ADC64rr:
  case X86::SUB64rr:
  case X86::SBB64rr:
  case X86::OR64rr:
  case X86::XOR64rr:
  case X86::AND64rr:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 64, true);
    }
    break;

  case X86::MOV8rr:
    buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 8, false);
    break;

  case X86::MOV16rr:
  case X86::MOVSX16rr16:
  case X86::MOVZX16rr16:
    buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 16, false);
    break;
  case X86::MOV32rr:
  case X86::MOVSX32rr32:
    buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 32, false);
    break;
  case X86::MOV64rr:
    buildMIWrapper(Opcode, OI, RegReg, AvailableRegs, 64, false);
    break;

  case X86::ADD8ri:
  case X86::ADC8ri:
  case X86::SUB8ri:
  case X86::SBB8ri:
  case X86::OR8ri:
  case X86::XOR8ri:
  case X86::AND8ri:
  case X86::SHL8ri:
  case X86::SHR8ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 8, true);
    }
    break;

  case X86::ADD16ri:
  case X86::ADC16ri:
  case X86::SUB16ri:
  case X86::SBB16ri:
  case X86::OR16ri:
  case X86::XOR16ri:
  case X86::AND16ri:
  case X86::SHL16ri:
  case X86::SHR16ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 16, true);
    }
    break;
  case X86::ADD32ri:
  case X86::ADC32ri:
  case X86::SUB32ri:
  case X86::SBB32ri:
  case X86::OR32ri:
  case X86::XOR32ri:
  case X86::AND32ri:
  case X86::SHL32ri:
  case X86::SHR32ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 32, true);
    }
    break;
  case X86::ADD64ri32:
  case X86::ADC64ri32:
  case X86::SUB64ri32:
  case X86::SBB64ri32:
  case X86::OR64ri32:
  case X86::XOR64ri32:
  case X86::AND64ri32:
  case X86::SHL64ri:
  case X86::SHR64ri:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 64, true);
    }
    break;

  case X86::MOV8ri:
    buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 8, false);
    break;

  case X86::MOV16ri:
    buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 16, false);
    break;
  case X86::MOV32ri:
    buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 32, false);
    break;
  case X86::MOV64ri32:
  case X86::MOV64ri:
    buildMIWrapper(Opcode, OI, RegImm, AvailableRegs, 64, false);
    break;

  case X86::ADD8rm:
  case X86::ADC8rm:
  case X86::SUB8rm:
  case X86::SBB8rm:
  case X86::OR8rm:
  case X86::XOR8rm:
  case X86::AND8rm:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 8, true);
    }
    break;

  case X86::ADD16rm:
  case X86::ADC16rm:
  case X86::SUB16rm:
  case X86::SBB16rm:
  case X86::OR16rm:
  case X86::XOR16rm:
  case X86::AND16rm:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 16, true);
    }
    break;
  case X86::ADD32rm:
  case X86::ADC32rm:
  case X86::SUB32rm:
  case X86::SBB32rm:
  case X86::OR32rm:
  case X86::XOR32rm:
  case X86::AND32rm:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 32, true);
    }
    break;
  case X86::ADD64rm:
  case X86::ADC64rm:
  case X86::SUB64rm:
  case X86::SBB64rm:
  case X86::OR64rm:
  case X86::XOR64rm:
  case X86::AND64rm:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 64, true);
    }
    break;

  case X86::MOV8rm:
    buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 8, false);
    break;

  case X86::MOV16rm:
  case X86::LEA16r:
    buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 16, false);
    break;
  case X86::MOV32rm:
  case X86::LEA32r:
    buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 32, false);
    break;
  case X86::MOV64rm:
  case X86::LEA64r:
    buildMIWrapper(Opcode, OI, RegMem, AvailableRegs, 64, false);
    break;

  case X86::INC8r:
  case X86::DEC8r:
  case X86::NOT8r:
  case X86::NEG8r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 8, true);
    }
    break;

  case X86::INC16r:
  case X86::DEC16r:
  case X86::NOT16r:
  case X86::NEG16r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 16, true);
    }
    break;

  case X86::INC32r:
  case X86::DEC32r:
  case X86::NOT32r:
  case X86::NEG32r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 32, true);
    }
    break;

  case X86::INC64r:
  case X86::DEC64r:
  case X86::NOT64r:
  case X86::NEG64r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 64, true);
    }
    break;
  case X86::RDRAND16r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 16, true);
    }
    break;
  case X86::RDRAND32r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 32, true);
    }
    break;
  case X86::RDRAND64r:
    if (OI.EFlagsAvailable) {
      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 64, true);
    }
    break;
  case X86::MUL8r:
  case X86::IMUL8r:
    if (OI.EFlagsAvailable &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::AX) !=
            AvailableRegs.end()) {

      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 8, false);
    }
    break;
  case X86::MUL16r:
  case X86::IMUL16r:
    if (OI.EFlagsAvailable &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::AX) !=
            AvailableRegs.end() &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::DX) !=
            AvailableRegs.end()) {

      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 16, false);
    }
    break;
  case X86::MUL32r:
  case X86::IMUL32r:
    if (OI.EFlagsAvailable &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::EAX) !=
            AvailableRegs.end() &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::EDX) !=
            AvailableRegs.end()) {

      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 32, false);
    }
    break;
  case X86::MUL64r:
  case X86::IMUL64r:
    if (OI.EFlagsAvailable &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::RAX) !=
            AvailableRegs.end() &&
        std::find(AvailableRegs.begin(), AvailableRegs.end(), X86::RDX) !=
            AvailableRegs.end()) {

      buildMIWrapper(Opcode, OI, OnlyReg, AvailableRegs, 64, false);
    }
    break;
  default:
    return;
  };
}
void X86RubbishCodePass::generateObfuscateInfo(
    MachineFunction &MF, std::vector<ObfuscateInstrInfo> &Items, bool Debug) {
  for (MachineBasicBlock &MBB : MF) {
    generateObfuscateInfo(MBB, Items, Debug);
  }
}
void X86RubbishCodePass::generateObfuscateInfo(
    MachineBasicBlock &MBB, std::vector<ObfuscateInstrInfo> &Items,
    bool Debug) {
  LivePhysRegs LiveRegs;
  MachineFunction *MF = MBB.getParent();
  LiveRegs.init(*MF->getSubtarget().getRegisterInfo());
  LiveRegs.addLiveOutsNoPristines(MBB);
  for (auto I = MBB.rbegin(), E = MBB.rend(); I != E; ++I) {
    ObfuscateInstrInfo Info;
    MachineInstr *Instr = &*I;
    Info.RawInst = Instr;
    LiveRegs.stepBackward(*I);
    if (Debug) {
      LiveRegs.print(llvm::errs());
      Instr->print(llvm::errs());
    }

    for (MCPhysReg Reg : RegList) {
      if (LiveRegs.available(*MRI, Reg)) {
        Info.AvailableRegs.push_back(Reg);
      }
    }
    if (LiveRegs.available(*MRI, X86::EFLAGS)) {
      Info.EFlagsAvailable = true;
    } else {
      Info.EFlagsAvailable = false;
    }
    Items.push_back(Info);
  }
}
void X86RubbishCodePass::process(MachineFunction &MF, ObfuscateOption &OO) {

  obfuscateControlFlow(MF);
  obfuscateDataFlow(MF);
  for (MachineBasicBlock &MBB : MF) {
    MBB.setMachineBlockAddressTaken();
    MBB.setLabelMustBeEmitted();
  }

} // namespace
bool X86RubbishCodePass::checkShouldProcess(MachineFunction &MF,
                                            ObfuscateOption &OO) {

  std::vector<MachineInstr *> Marks;
  for (MachineBasicBlock &MBB : MF) {
    for (MachineInstr &MI : MBB) {
      if (MI.getOpcode() == X86::INLINEASM) {
        MachineOperand &MO = MI.getOperand(0);
        if (!MO.isSymbol()) {
          continue;
        }
        const char *Name = MO.getSymbolName();
        if (!strcmp(Name, "backend-obfu")) {
          Marks.push_back(&MI);
          OO.InsertRubbishCode = true;
        }
      }
    }
  }
  unsigned Num = Marks.size();
  for (MachineInstr *MI : Marks) {
    MI->eraseFromParent();
  }
  return Num != 0;
}
#define SAVE_REG
void X86RubbishCodePass::processCSR(MachineFunction &MF,
                                    std::vector<MachineInstr *> &Rets) {
  const MCPhysReg *CSR = MRI->getCalleeSavedRegs();
  std::vector<MCPhysReg> CSRList;
  for (MCPhysReg i = 0; CSR[i] != X86::NoRegister; i++) {
    CSRList.push_back(CSR[i]);
  }

  /*MachineBasicBlock &EntryMBB = MF.front();
  MachineBasicBlock::iterator EntryMI = EntryMBB.begin();
  for (MCPhysReg Reg : CSRList) {
    BuildMI(EntryMBB, EntryMI, EntryMI->getDebugLoc(), TII->get(X86::PUSH64r),
            Reg);
  }
  std::vector<MCPhysReg> RevCSRList(CSRList.rbegin(), CSRList.rend());
  for (MachineInstr *MI : Rets) {
    for (MCPhysReg Reg : RevCSRList) {
      BuildMI(*MI->getParent(), *MI, MI->getDebugLoc(), TII->get(X86::POP64r),
              Reg);
    }
  }*/

  std::vector<MCPhysReg> ToRemove;
  for (MCPhysReg RegA : CSRList) {
    for (MCPhysReg RegB : RegList) {
      if (TRI->isSubRegisterEq(RegA, RegB)) {
        ToRemove.push_back(RegB);
      }
    }
  }
  for (MCPhysReg Reg : ToRemove) {
    auto Iter = std::find(RegList.begin(), RegList.end(), Reg);
    RegList.erase(Iter);
  }
}
bool X86RubbishCodePass::runOnMachineFunction(MachineFunction &MF) {
  srand(time(0));
  if (!MF.getSubtarget<X86Subtarget>().is64Bit()) {
    return false;
  }

  MRI = &MF.getRegInfo();
  TII = MF.getSubtarget<X86Subtarget>().getInstrInfo();
  TRI = MF.getSubtarget().getRegisterInfo();
  MFI = &MF.getFrameInfo();

  ObfuscateOption OO;
  if (checkShouldProcess(MF, OO)) {
    std::vector<MachineInstr *> Rets;
    /*for (MachineBasicBlock &MBB : MF) {
      for (MachineInstr &MI : MBB) {
        if (MI.isReturn()) {
          Rets.push_back(&MI);
        }
      }
    }*/
    // processCSR(MF, Rets);
    process(MF, OO);

    return true;
  }
  return false;
}