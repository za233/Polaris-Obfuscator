#include "llvm/IR/Function.h"
#include <string>
#include <vector>
using namespace llvm;
namespace polaris {
std::string readAnnotate(Function &f);
uint64_t getRandomNumber();
unsigned int getUniqueNumber(std::vector<unsigned int> &rand_list);
void getRandomNoRepeat(unsigned upper_bound, unsigned size,
                       std::vector<unsigned> &result);
uint64_t getInverse(uint64_t a, uint64_t m);
void demoteRegisters(Function *f);
} // namespace polaris
