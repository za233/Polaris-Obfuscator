#pragma once

#include "llvm/Passes/PassBuilder.h"
#include <map>
#include <utility>
#include <vector>
#define RAW_INST 0
#define PUSH_ADDR 1
#define STORE_IMM 2
#define JUMP_TO 3
#define BRANCH 4
using namespace llvm;
namespace polaris {
struct PrefixTree {
  unsigned char val = 0;
  std::map<unsigned char, PrefixTree *> sons;
};
#define SHL 1
#define SHR 2
#define XOR 3
#define OR 4
#define ADD 5
#define CONST 6
#define VAR 7
struct RandExpr {
  int op;
  struct RandExpr *l, *r;
  unsigned int data;
};
struct VMOpcodeInfo {
  int len;
  unsigned char code[4];
};
struct VMOpInfo {
  VMOpcodeInfo opcode;
  int builtin_type = RAW_INST;
  std::vector<std::pair<int, Value *>> opnds;
  union {
    Instruction *instr = nullptr;
    int op_size;
  };
};
struct LLVMVM : public PassInfoMixin<LLVMVM> {
  static char ID;
  std::vector<Function *> vm_funcs;
  std::map<Function *, Function *> vm_mapping;
  Function *cipher;
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

  static bool isRequired() { return true; }
  void allocateOpcodeKey(Function &f, std::map<BasicBlock *, int> &bb_map);
  Function *buildCipher(Module *mod);
  void demoteRegisters(Function *f);
  BasicBlock *handleAlloca(Function &f, std::map<Value *, int> &value_map,
                           std::vector<std::pair<int, int>> &remap, int &space);
  Function *virtualization(Function &f);
  VMOpInfo *getOrCreateRawOp(Instruction &instr, std::vector<VMOpInfo *> &ops);
  bool check(Function &f);
  void fixCallInst(Function *target, Function *orig);
  void createBuiltinOps(std::vector<VMOpInfo *> &ops);
  void allocateOpcode(std::vector<VMOpInfo *> &ops);
  Value *decodeBytecode(IRBuilder<> &irb, Value *buf, Value *op_arr,
                        Value *cipher_arg, bool shift, Type *val_type);
  RandExpr *generateRandExpr(int turn);
  void destoryRandExpr(RandExpr *root);
  Value *randExpr2Ir(IRBuilder<> &irb, Value *val, RandExpr *tree);
  void buildVMFunction(Function &f, BasicBlock *op_entry, Function &vm,
                       std::vector<VMOpInfo *> &ops, int mem_size,
                       GlobalVariable *opcodes, int tmp_size,
                       std::vector<std::pair<int, int>> &remap,
                       std::map<Value *, int> &value_map,
                       std::map<BasicBlock *, int> &bb_key_map,
                       std::map<VMOpcodeInfo *, RandExpr *> &cipher_map);
  unsigned int evalRandExpr(RandExpr *tree, unsigned int v);
  int generateBytecodes(BasicBlock *entry_block,
                        std::vector<BasicBlock *> &code,
                        std::map<Value *, int> &locals_addr_map,
                        std::map<Instruction *, VMOpInfo *> &instr_map,
                        std::vector<VMOpInfo *> &ops, int mem_size,
                        std::vector<Constant *> &opcodes,
                        std::map<BasicBlock *, int> &bb_key_map,
                        std::map<VMOpcodeInfo *, RandExpr *> &cipher_map);
  int allocaMemory(BasicBlock &bb, std::map<Instruction *, int> &alloca_map,
                   int mem_base);
};
} // namespace