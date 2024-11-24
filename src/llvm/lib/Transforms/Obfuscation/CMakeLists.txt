add_llvm_component_library(LLVMObfuscation
  Utils.cpp
  AliasAccess.cpp
  BogusControlFlow.cpp
  BogusControlFlow2.cpp
  CustomCC.cpp
  Flattening.cpp
  GlobalsEncryption.cpp
  IndirectBranch.cpp
  IndirectCall.cpp
  LinearMBA.cpp
  MergeFunction.cpp
  Substitution.cpp
  Pipeline.cpp
  MBAMatrix.cpp

  LINK_COMPONENTS
  Core
  Support
  Analysis
  TransformUtils
  
  )

