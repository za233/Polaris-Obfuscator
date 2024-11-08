#include "llvm/Transforms/Obfuscation/Flattening.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Obfuscation/Utils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/Local.h"
#include <algorithm>
#include <cstdlib>
#include <vector>
using namespace llvm;
namespace polaris {

Function *Flattening::buildUpdateKeyFunc(Module *m) {
  std::vector<Type *> params;
  params.push_back(Type::getInt8Ty(m->getContext()));
  params.push_back(Type::getInt32Ty(m->getContext()));
  params.push_back(Type::getInt32Ty(m->getContext())->getPointerTo());
  params.push_back(Type::getInt32Ty(m->getContext())->getPointerTo());
  params.push_back(Type::getInt32Ty(m->getContext()));
  FunctionType *funcType =
      FunctionType::get(Type::getVoidTy(m->getContext()), params, false);
  Function *func = Function::Create(funcType, GlobalValue::PrivateLinkage,
                                    Twine("ollvm"), m);
  BasicBlock *entry = BasicBlock::Create(m->getContext(), "entry", func);
  BasicBlock *cond = BasicBlock::Create(m->getContext(), "cond", func);
  BasicBlock *update = BasicBlock::Create(m->getContext(), "update", func);
  BasicBlock *end = BasicBlock::Create(m->getContext(), "end", func);
  Function::arg_iterator iter = func->arg_begin();
  Value *flag = iter;
  Value *len = ++iter;
  Value *posArray = ++iter;
  Value *keyArray = ++iter;
  Value *num = ++iter;
  IRBuilder<> irb(entry);
  Value *i = irb.CreateAlloca(irb.getInt32Ty());
  irb.CreateStore(irb.getInt32(0), i);
  irb.CreateCondBr(irb.CreateICmpEQ(flag, irb.getInt8(0)), cond, end);

  irb.SetInsertPoint(cond);
  irb.CreateCondBr(irb.CreateICmpSLT(irb.CreateLoad(irb.getInt32Ty(), i), len),
                   update, end);

  irb.SetInsertPoint(update);

  Value *pos = irb.CreateLoad(
      irb.getInt32Ty(), irb.CreateGEP(irb.getInt32Ty(), posArray,
                                      irb.CreateLoad(irb.getInt32Ty(), i)));
  Value *key = irb.CreateGEP(irb.getInt32Ty(), keyArray, pos);
  irb.CreateStore(irb.CreateXor(irb.CreateLoad(irb.getInt32Ty(), key), num),
                  key);
  irb.CreateStore(
      irb.CreateAdd(irb.CreateLoad(irb.getInt32Ty(), i), irb.getInt32(1)), i);
  irb.CreateBr(cond);

  irb.SetInsertPoint(end);
  irb.CreateRetVoid();
  return func;
}

void Flattening::doFlatten(Function *f, int seed, Function *updateFunc) {

  /*srand(seed);
  std::vector<BasicBlock *> origBB;
  for (BasicBlock &basicBlock : *f)
    origBB.push_back(&basicBlock);
  if (origBB.size() <= 1)
    return;

  unsigned int rand_val = seed;
  BasicBlock *oldEntry = &f->getEntryBlock();
  BranchInst *firstBr = NULL;
  if (isa<BranchInst>(oldEntry->getTerminator()))
    firstBr = cast<BranchInst>(oldEntry->getTerminator());
  BasicBlock *firstbb = oldEntry->getTerminator()->getSuccessor(0);

  BasicBlock::iterator iter = oldEntry->end(); // Split the first basic block
  iter--;
  if (oldEntry->size() > 1)
    iter--;
  BasicBlock *splited = oldEntry->splitBasicBlock(iter, Twine("FirstBB"));
  firstbb = splited;
  origBB.insert(origBB.begin(), splited);

  // remove the block which contains landingpad inst
  std::vector<BasicBlock *> removeBB;
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++) {
    BasicBlock *block = *b;
    Value *inst = block->getTerminator();
    if (isa<InvokeInst>(*inst)) {
      InvokeInst *invoke = (InvokeInst *)inst;
      // removeBB.push_back(block);
      removeBB.push_back(invoke->getUnwindDest());
    }
  }

  for (std::vector<BasicBlock *>::iterator b = removeBB.begin();
       b != removeBB.end(); b++) {
    BasicBlock *block = *b;
    std::vector<BasicBlock *>::iterator find =
        std::find(origBB.begin(), origBB.end(), block);
    if (find != origBB.end())
      origBB.erase(find);
  }

  IRBuilder<> irb(&*oldEntry->getFirstInsertionPt()); // generate context info
                                                      // key for each block
  Value *visitedArray =
      irb.CreateAlloca(irb.getInt8Ty(), irb.getInt32(origBB.size()));
  Value *keyArray =
      irb.CreateAlloca(irb.getInt32Ty(), irb.getInt32(origBB.size()));
  irb.CreateMemSet(visitedArray, irb.getInt8(0), origBB.size(), (MaybeAlign)0);
  irb.CreateMemSet(keyArray, irb.getInt8(0), origBB.size() * 4, (MaybeAlign)0);
  int idx = 0;
  std::vector<unsigned int> key_list;
  DominatorTree tree(*f);
  std::map<BasicBlock *, unsigned int> key_map;
  std::map<BasicBlock *, unsigned int> index_map;
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++) {
    BasicBlock *block = *b;
    unsigned int num = getUniqueNumber(key_list);
    key_list.push_back(num);
    key_map[block] = 0;
  }
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++, idx++) {
    BasicBlock *block = *b;
    std::vector<Constant *> doms;
    int i = 0;
    for (std::vector<BasicBlock *>::iterator bb = origBB.begin();
         bb != origBB.end(); bb++, i++) {
      BasicBlock *block0 = *bb;
      if (block0 != block && tree.dominates(block, block0)) {
        doms.push_back(irb.getInt32(i));
        key_map[block0] ^= key_list[idx];
      }
    }
    irb.SetInsertPoint(block->getTerminator());
    Value *ptr =
        irb.CreateGEP(irb.getInt8Ty(), visitedArray, irb.getInt32(idx));
    Value *visited = irb.CreateLoad(irb.getInt8Ty(), ptr);
    if (doms.size() != 0) {
      ArrayType *arrayType = ArrayType::get(irb.getInt32Ty(), doms.size());
      Constant *doms_array =
          ConstantArray::get(arrayType, ArrayRef<Constant *>(doms));
      GlobalVariable *dom_variable = new GlobalVariable(
          *(f->getParent()), arrayType, false,
          GlobalValue::LinkageTypes::PrivateLinkage, doms_array, "doms");
      irb.CreateCall(FunctionCallee(updateFunc),
                     {visited, irb.getInt32(doms.size()),
                      irb.CreateGEP(arrayType, dom_variable,
                                    {irb.getInt32(0), irb.getInt32(0)}),
                      keyArray, irb.getInt32(key_list[idx])});
    }

    irb.CreateStore(irb.getInt8(1), ptr);
    index_map[block] = idx;
  }

  //
  //- patch 1

  BasicBlock *newEntry = oldEntry; // Prepare basic block
  BasicBlock *loopBegin =
      BasicBlock::Create(f->getContext(), "LoopBegin", f, newEntry);
  BasicBlock *defaultCase =
      BasicBlock::Create(f->getContext(), "DefaultCase", f, newEntry);
  newEntry->moveBefore(loopBegin);
  BranchInst::Create(
      loopBegin, defaultCase); // Create branch instruction,link basic blocks
  newEntry->getTerminator()->eraseFromParent();
  BranchInst::Create(loopBegin, newEntry);
  AllocaInst *switchVar =
      new AllocaInst(Type::getInt32Ty(f->getContext()), 0, Twine("switchVar"),
                     newEntry->getTerminator()); // Create switch variable
  LoadInst *swValue =
      new LoadInst(switchVar->getAllocatedType(), switchVar, "cmd", loopBegin);
  SwitchInst *sw = SwitchInst::Create(swValue, defaultCase, 0, loopBegin);
  std::vector<unsigned int> rand_list;
  unsigned int startNum = 0;
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++) // Put basic blocks into switch structure
  {
    BasicBlock *block = *b;
    unsigned int num = getUniqueNumber(rand_list);
    rand_list.push_back(num);
    if (block == newEntry)
      continue;
    if (block == firstbb)
      startNum = num;
    ConstantInt *numCase =
        cast<ConstantInt>(ConstantInt::get(sw->getCondition()->getType(), num));
    sw->addCase(numCase, block);
  }
  ConstantInt *startVal = cast<ConstantInt>(ConstantInt::get(
      sw->getCondition()->getType(), startNum)); // Set the entry value
  new StoreInst(startVal, switchVar, newEntry->getTerminator());
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++) // Handle successors
  {
    BasicBlock *block = *b;
    irb.SetInsertPoint(block);
    if (block == newEntry)
      continue;
    if (isa<BranchInst>(*block->getTerminator())) {
      if (block->getTerminator()->getNumSuccessors() == 1) {
        BasicBlock *succ = block->getTerminator()->getSuccessor(0);
        ConstantInt *caseNum = sw->findCaseDest(succ);

        if (caseNum == NULL) {
          unsigned int num = getUniqueNumber(rand_list);
          rand_list.push_back(num);
          caseNum = cast<ConstantInt>(
              ConstantInt::get(sw->getCondition()->getType(), num));
        }
        unsigned int fixNum =
            caseNum->getValue().getZExtValue() ^ key_map[block];
        block->getTerminator()->eraseFromParent();

        irb.SetInsertPoint(block);
        irb.CreateStore(
            irb.CreateXor(
                irb.CreateLoad(irb.getInt32Ty(),
                               irb.CreateGEP(irb.getInt32Ty(), keyArray,
                                             irb.getInt32(index_map[block]))),
                ConstantInt::get(sw->getCondition()->getType(), fixNum)),
            switchVar);
        BranchInst::Create(defaultCase, block);
      } else if (block->getTerminator()->getNumSuccessors() == 2) {
        BasicBlock *succTrue = block->getTerminator()->getSuccessor(0);
        BasicBlock *succFalse = block->getTerminator()->getSuccessor(1);
        ConstantInt *numTrue = sw->findCaseDest(succTrue);
        ConstantInt *numFalse = sw->findCaseDest(succFalse);

        if (numTrue == NULL) {
          unsigned int num = getUniqueNumber(rand_list);
          rand_list.push_back(num);
          numTrue = cast<ConstantInt>(
              ConstantInt::get(sw->getCondition()->getType(), num));
        }
        if (numFalse == NULL) {
          unsigned int num = getUniqueNumber(rand_list);
          rand_list.push_back(num);
          numFalse = cast<ConstantInt>(
              ConstantInt::get(sw->getCondition()->getType(), num));
        }
        unsigned int fixNumTrue =
            numTrue->getValue().getZExtValue() ^ key_map[block];
        unsigned int fixNumFalse =
            numFalse->getValue().getZExtValue() ^ key_map[block];
        BranchInst *oldBr = cast<BranchInst>(block->getTerminator());
        SelectInst *select = SelectInst::Create(
            oldBr->getCondition(),
            ConstantInt::get(sw->getCondition()->getType(), fixNumTrue),
            ConstantInt::get(sw->getCondition()->getType(), fixNumFalse),
            Twine("choice"), block->getTerminator());
        block->getTerminator()->eraseFromParent();

        irb.SetInsertPoint(block);
        irb.CreateStore(
            irb.CreateXor(
                irb.CreateLoad(irb.getInt32Ty(),
                               irb.CreateGEP(irb.getInt32Ty(), keyArray,
                                             irb.getInt32(index_map[block]))),
                select),
            switchVar);
        // LoadInst *swValue2 = new LoadInst(switchVar->getAllocatedType(),
        // switchVar, "cmd", loopBegin); SwitchInst *sw2 =
        // SwitchInst::Create(swValue2,
        // defaultCase, 0, block);

        // BranchInst::Create(loopBegin, block);
        BranchInst::Create(defaultCase, block);
      }
    } else
      continue;
  }
  demoteRegisters(f);*/

  srand(seed);
  std::vector<BasicBlock *> origBB;
  for (BasicBlock &basicBlock : *f)
    origBB.push_back(&basicBlock);
  if (origBB.size() <= 1)
    return;
  unsigned int rand_val = seed;
  Function::iterator tmp = f->begin();
  BasicBlock *oldEntry = &*tmp;
  origBB.erase(origBB.begin());
  BranchInst *firstBr = NULL;
  if (isa<BranchInst>(oldEntry->getTerminator()))
    firstBr = cast<BranchInst>(oldEntry->getTerminator());
  BasicBlock *firstbb = oldEntry->getTerminator()->getSuccessor(0);
  if ((firstBr != NULL && firstBr->isConditional()) ||
      oldEntry->getTerminator()->getNumSuccessors() >
          2) // Split the first basic block
  {
    BasicBlock::iterator iter = oldEntry->end();
    iter--;
    if (oldEntry->size() > 1)
      iter--;
    BasicBlock *splited = oldEntry->splitBasicBlock(iter, Twine("FirstBB"));
    firstbb = splited;
    origBB.insert(origBB.begin(), splited);
  }
  BasicBlock *newEntry = oldEntry; // Prepare basic block
  BasicBlock *loopBegin =
      BasicBlock::Create(f->getContext(), "LoopBegin", f, newEntry);
  BasicBlock *defaultCase =
      BasicBlock::Create(f->getContext(), "DefaultCase", f, newEntry);
  BasicBlock *loopEnd =
      BasicBlock::Create(f->getContext(), "LoopEnd", f, newEntry);
  newEntry->moveBefore(loopBegin);
  BranchInst::Create(
      loopEnd, defaultCase); // Create branch instruction,link basic blocks
  BranchInst::Create(loopBegin, loopEnd);
  newEntry->getTerminator()->eraseFromParent();
  BranchInst::Create(loopBegin, newEntry);
  AllocaInst *switchVar =
      new AllocaInst(Type::getInt32Ty(f->getContext()), 0, Twine("switchVar"),
                     newEntry->getTerminator()); // Create switch variable
  LoadInst *value =
      new LoadInst(switchVar->getAllocatedType(), switchVar, "cmd", loopBegin);
  SwitchInst *sw = SwitchInst::Create(value, defaultCase, 0, loopBegin);
  std::vector<unsigned int> rand_list;
  unsigned int startNum = 0;
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++) // Put basic blocks into switch structure
  {
    BasicBlock *block = *b;
    block->moveBefore(loopEnd);
    unsigned int num = getUniqueNumber(rand_list);
    rand_list.push_back(num);
    if (block == firstbb)
      startNum = num;
    ConstantInt *numCase =
        cast<ConstantInt>(ConstantInt::get(sw->getCondition()->getType(), num));
    sw->addCase(numCase, block);
  }
  ConstantInt *startVal = cast<ConstantInt>(ConstantInt::get(
      sw->getCondition()->getType(), startNum)); // Set the entry value
  new StoreInst(startVal, switchVar, newEntry->getTerminator());
  errs() << "Put Block Into Switch\n";
  for (std::vector<BasicBlock *>::iterator b = origBB.begin();
       b != origBB.end(); b++) // Handle successors
  {
    BasicBlock *block = *b;
    if (block->getTerminator()->getNumSuccessors() == 1) {
      errs() << "This block has 1 successor\n";
      BasicBlock *succ = block->getTerminator()->getSuccessor(0);
      ConstantInt *caseNum = sw->findCaseDest(succ);
      if (caseNum == NULL) {
        unsigned int num = getUniqueNumber(rand_list);
        rand_list.push_back(num);
        caseNum = cast<ConstantInt>(
            ConstantInt::get(sw->getCondition()->getType(), num));
      }
      block->getTerminator()->eraseFromParent();
      new StoreInst(caseNum, switchVar, block);
      BranchInst::Create(loopEnd, block);
    } else if (block->getTerminator()->getNumSuccessors() == 2) {
      errs() << "This block has 2 successors\n";
      BasicBlock *succTrue = block->getTerminator()->getSuccessor(0);
      BasicBlock *succFalse = block->getTerminator()->getSuccessor(1);
      ConstantInt *numTrue = sw->findCaseDest(succTrue);
      ConstantInt *numFalse = sw->findCaseDest(succFalse);
      if (numTrue == NULL) {
        unsigned int num = getUniqueNumber(rand_list);
        rand_list.push_back(num);
        numTrue = cast<ConstantInt>(
            ConstantInt::get(sw->getCondition()->getType(), num));
      }
      if (numFalse == NULL) {
        unsigned int num = getUniqueNumber(rand_list);
        rand_list.push_back(num);
        numFalse = cast<ConstantInt>(
            ConstantInt::get(sw->getCondition()->getType(), num));
      }
      BranchInst *oldBr = cast<BranchInst>(block->getTerminator());
      SelectInst *select =
          SelectInst::Create(oldBr->getCondition(), numTrue, numFalse,
                             Twine("choice"), block->getTerminator());
      block->getTerminator()->eraseFromParent();
      new StoreInst(select, switchVar, block);
      BranchInst::Create(loopEnd, block);
    } else
      continue;
  }
  demoteRegisters(f);
}

PreservedAnalyses Flattening::run(Module &M, ModuleAnalysisManager &AM) {
  Function *updateFunc = buildUpdateKeyFunc(&M);
  for (Function &f : M) {
    if (&f == updateFunc)
      continue;
    if (readAnnotate(f).find("flatten") != std::string::npos) {
      doFlatten(&f, 0, updateFunc);
    }
  }

  return PreservedAnalyses::none();
}
} // namespace polaris
