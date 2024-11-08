#include "llvm/Transforms/Obfuscation/Utils.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instruction.h"
#include "llvm/Transforms/Utils/Local.h"
#include <algorithm>
#include <ctime>
#include <random>
using namespace llvm;
namespace polaris {

std::string readAnnotate(Function &f) {
  std::string annotation = "";
  GlobalVariable *glob =
      f.getParent()->getGlobalVariable("llvm.global.annotations");
  if (glob != NULL) {
    if (ConstantArray *ca = dyn_cast<ConstantArray>(glob->getInitializer())) {
      for (unsigned i = 0; i < ca->getNumOperands(); ++i) {
        if (ConstantStruct *structAn =
                dyn_cast<ConstantStruct>(ca->getOperand(i))) {
          if (structAn->getOperand(0) == &f) {
            if (GlobalVariable *annoteStr =
                    dyn_cast<GlobalVariable>(structAn->getOperand(1))) {
              if (ConstantDataSequential *data =
                      dyn_cast<ConstantDataSequential>(
                          annoteStr->getInitializer())) {
                if (data->isString()) {
                  annotation += data->getAsString().lower() + " ";
                }
              }
            }
          }
          // structAn->dump();
        }
      }
    }
  }
  return (annotation);
}
uint64_t getRandomNumber() {
  return (((uint64_t)rand()) << 32) | ((uint64_t)rand());
}
uint32_t getUniqueNumber(std::vector<uint32_t> &rand_list) {
  uint32_t num = getRandomNumber() & 0xffffffff;
  while (true) {
    bool state = true;
    for (auto n = rand_list.begin(); n != rand_list.end(); n++) {
      if (*n == num) {
        state = false;
        break;
      }
    }

    if (state)
      break;
    num = getRandomNumber() & 0xffffffff;
  }
  return num;
}

void getRandomNoRepeat(unsigned upper_bound, unsigned size,
                       std::vector<unsigned> &result) {
  assert(upper_bound >= size);
  std::vector<unsigned> list;
  for (unsigned i = 0; i < upper_bound; i++) {
    list.push_back(i);
  }

  std::shuffle(list.begin(), list.end(), std::default_random_engine());
  for (unsigned i = 0; i < size; i++) {
    result.push_back(list[i]);
  }
}
// ax = 1 (mod m)
void exgcd(uint64_t a, uint64_t b, uint64_t &d, uint64_t &x, uint64_t &y) {
  if (!b) {
    d = a, x = 1, y = 0;
  } else {
    exgcd(b, a % b, d, y, x);
    y -= x * (a / b);
  }
}
uint64_t getInverse(uint64_t a, uint64_t m) {
  assert(a != 0);
  uint64_t x, y, d;
  exgcd(a, m, d, x, y);
  return d == 1 ? (x + m) % m : 0;
}
void demoteRegisters(Function *f) {
  std::vector<PHINode *> tmpPhi;
  std::vector<Instruction *> tmpReg;
  BasicBlock *bbEntry = &*f->begin();
  for (Function::iterator i = f->begin(); i != f->end(); i++) {
    for (BasicBlock::iterator j = i->begin(); j != i->end(); j++) {
      if (isa<PHINode>(j)) {
        PHINode *phi = cast<PHINode>(j);
        tmpPhi.push_back(phi);
        continue;
      }
      if (!(isa<AllocaInst>(j) && j->getParent() == bbEntry) &&
          j->isUsedOutsideOfBlock(&*i)) {
        tmpReg.push_back(&*j);
        continue;
      }
    }
  }
  for (unsigned int i = 0; i < tmpReg.size(); i++)
    DemoteRegToStack(*tmpReg.at(i), f->begin()->getTerminator());
  for (unsigned int i = 0; i < tmpPhi.size(); i++)
    DemotePHIToStack(tmpPhi.at(i), f->begin()->getTerminator());
}
} // namespace polaris