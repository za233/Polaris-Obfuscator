#pragma once

#include "llvm/Passes/PassBuilder.h"

using namespace llvm;
namespace polaris {
struct BitwiseTerm {
  int TruthTable[4];
  Value *(*Builder)(IRBuilder<> &, Value *, Value *);
};

struct LinearMBATerm {
  BitwiseTerm *TermInfo;
  int64_t Coefficient;
};
#define DEFINE_TERM_FUNC(ID)                                                   \
  Value *buildExpr##ID(IRBuilder<> &, Value *, Value *)
#define DEFINE_TERM_INFO(ID)                                                   \
  {{(TERM_##ID(0, 0)) & 1, (TERM_##ID(0, 1)) & 1, (TERM_##ID(1, 0)) & 1,       \
    (TERM_##ID(1, 1)) & 1},                                                    \
   buildExpr##ID}

#define TERM_0(x, y) x &y
DEFINE_TERM_FUNC(0);

#define TERM_1(x, y) x & ~y
DEFINE_TERM_FUNC(1);

#define TERM_2(x, y) x
DEFINE_TERM_FUNC(2);

#define TERM_3(x, y) ~x ^ y
DEFINE_TERM_FUNC(3);

#define TERM_4(x, y) y
DEFINE_TERM_FUNC(4);

#define TERM_5(x, y) x ^ y
DEFINE_TERM_FUNC(5);

#define TERM_6(x, y) x | y
DEFINE_TERM_FUNC(6);

#define TERM_7(x, y) ~(x | y)
DEFINE_TERM_FUNC(7);

#define TERM_8(x, y) ~(x ^ y)
DEFINE_TERM_FUNC(8);

#define TERM_9(x, y) ~y
DEFINE_TERM_FUNC(9);

#define TERM_10(x, y) x | ~y
DEFINE_TERM_FUNC(10);

#define TERM_11(x, y) ~x
DEFINE_TERM_FUNC(11);

#define TERM_12(x, y) ~x | y
DEFINE_TERM_FUNC(12);

#define TERM_13(x, y) ~(x & y)
DEFINE_TERM_FUNC(13);

#define TERM_TYPE_NUM 14

struct LinearMBA : PassInfoMixin<LinearMBA> {
  PreservedAnalyses run(Function &M, FunctionAnalysisManager &AM);
  void process(Function &F);
  bool processAt(Instruction &Insn);
  void randomSelectTerms(std::vector<LinearMBATerm> &SelectedTerms);
  void calcCoefficients(std::vector<LinearMBATerm> &SelectedTerms);
  Value *buildLinearMBA(BinaryOperator *OriginalInsn,
                        std::vector<LinearMBATerm> &Terms);
  static bool isRequired() { return true; }
};

}; // namespace polaris