# Polairs-Obfuscator

Polairs-Obfuscator is a code obfuscator based on LLVM 16.0.6.This project contain several IR-based obfuscation and backend obfuscation which can transform the code into a more complex form in the IR level (or assemble level) while preserving the original code's semantics. Using this obfuscator to compile code can prevent you code from being cracked.  

## Features

Compared with the OLLVM framework, this framework not only provides obfuscation based on LLVM IR, but also provides obfuscation based on MIR within LLVM backend.

### 0x1 IR Level Obfuscation

- **Alias Access**:  Use pointer aliases to access local variables.
- **Flattening**: Control flow flattening obfuscation.
- **Indirect Branch**: Use real-time computed target addresses for indirect jumps.
- **Indirect Call**:  Using real-time computed function address for .
- **String Encryption**: Encrypt global constants in the program and decrypt them in the function stack.(instead of .ctor)
- **Bogus Control Flow**: Insert amount of conditional jumps with opaque predicates to complicate the control flow graph.
- **Instruction Substitution**: Replace the arithmetic instruction with an equivalent set of arithmetic instructions.
- **Merge Function**： Merge several functions into one function.

### 0x2 MIR Level Obfuscation

Polaris's back-end obfuscation is designed to make decompilers ineffective, preventing IR-based obfuscation from being removed. Polaris's backend obfuscation can disrupt the disassembly phase of the  decompiler, making it unable to properly identify functions. In  addition, the backend data flow obfuscation can render the decompilation process ineffective, generating nonsensical pseudocode.  It uses four obfuscation techniques to achieve those effects.

- **Dirty Bytes Insertion** : It inserts meaningless data between machine instructions and leverages opaque predicate and conditional jump instructions to prevent the data from being executed.
- **Function Splitting**:  It may cause decompilers to misidentify the basic block as a function and attempt to decompile it. 
- **Junk Instruction Insertion**:  By inserting numerous junk instructions with side effects but no impact on program semantics, the data flow analysis conducted by decompilers can be impeded significantly.
- **Instruction Substitution**:  It replaces specify instructions with several instructions which have the same semantics. It reduces the disparity between junk instructions and original instructions


## Build

**Download the complete LLVM-16.0.6 project and copy the `llvm` folder from `src` into the LLVM project directory.**

Then Configure and build LLVM and Clang:

* ``cd llvm-project``

* ``cmake -S llvm -B build -G <generator> [options]``

   Some common build system generators are:

   * ``Ninja`` --- for generating [Ninja](https://ninja-build.org)
     build files. Most llvm developers use Ninja.
   * ``Unix Makefiles`` --- for generating make-compatible parallel makefiles.
   * ``Visual Studio`` --- for generating Visual Studio projects and
     solutions.
   * ``Xcode`` --- for generating Xcode projects.

   Some common options:

   * ``-DLLVM_ENABLE_PROJECTS='...'`` and ``-DLLVM_ENABLE_RUNTIMES='...'`` ---
     semicolon-separated list of the LLVM sub-projects and runtimes you'd like to
     additionally build. ``LLVM_ENABLE_PROJECTS`` can include any of: clang,
     clang-tools-extra, cross-project-tests, flang, libc, libclc, lld, lldb,
     mlir, openmp, polly, or pstl. ``LLVM_ENABLE_RUNTIMES`` can include any of
     libcxx, libcxxabi, libunwind, compiler-rt, libc or openmp. Some runtime
     projects can be specified either in ``LLVM_ENABLE_PROJECTS`` or in
     ``LLVM_ENABLE_RUNTIMES``.

     For example, to build LLVM, Clang, libcxx, and libcxxabi, use
     ``-DLLVM_ENABLE_PROJECTS="clang" -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi"``.

   * ``-DCMAKE_INSTALL_PREFIX=directory`` --- Specify for *directory* the full
     path name of where you want the LLVM tools and libraries to be installed
     (default ``/usr/local``). Be careful if you install runtime libraries: if
     your system uses those provided by LLVM (like libc++ or libc++abi), you
     must not overwrite your system's copy of those libraries, since that
     could render your system unusable. In general, using something like
     ``/usr`` is not advised, but ``/usr/local`` is fine.

   * ``-DCMAKE_BUILD_TYPE=type`` --- Valid options for *type* are Debug,
     Release, RelWithDebInfo, and MinSizeRel. Default is Debug.

   * ``-DLLVM_ENABLE_ASSERTIONS=On`` --- Compile with assertion checks enabled
     (default is Yes for Debug builds, No for all other build types).

 * ``cmake --build build [-- [options] <target>]`` or your build system specified above
   directly.

   * The default target (i.e. ``ninja`` or ``make``) will build all of LLVM.

   * The ``check-all`` target (i.e. ``ninja check-all``) will run the
     regression tests to ensure everything is in working order.

   * CMake will generate targets for each tool and library, and most
     LLVM sub-projects generate their own ``check-<project>`` target.

   * Running a serial build will be **slow**. To improve speed, try running a
     parallel build. That's done by default in Ninja; for ``make``, use the option
     ``-j NNN``, where ``NNN`` is the number of parallel jobs to run.
     In most cases, you get the best performance if you specify the number of CPU threads you have.
     On some Unix systems, you can specify this with ``-j$(nproc)``.

 * For more information see [CMake](https://llvm.org/docs/CMake.html).

Consult the
[Getting Started with LLVM](https://llvm.org/docs/GettingStarted.html#getting-started-with-llvm)
page for detailed information on configuring and compiling LLVM. You can visit
[Directory Layout](https://llvm.org/docs/GettingStarted.html#directory-layout)
to learn about the layout of the source code tree.

## Usage

### 1. Command

Use this command: ``clang -mllvm -passes=<obfuscation passes> <source file> -o <target>   `` to compile ``<source file>`` with ``<obfuscation passes> ``  enabled.

here are some supported pass's names:

- **fla**: enable flattening obfuscation
- **gvenc**:  enable global variable(string) encryption obfuscation
- **indcall**: enable indirect call obfuscation
- **indbr**: enable indirect branch obfuscation
- **alias**: enable alias access obfuscation
- **bcf**: enable bogus control flow obfuscation
- **sub**: enable instruction substitution obfuscation
- **merge**: enable functions merging obfuscation

Enabling multiple obfuscation passes is supported,  you should separate pass names with commas.

for example:

```
clang -mllvm -passes=fla,indcall test.cpp -o test
```

this command will enable flattening obfuscation and indirect call obfuscation while compiling.

### 2. Mark Target Function

After enabling the pass, you need to mark functions in your source as follows to inform the obfuscator which functions should be obfuscated.

For **IR-based obfuscation**, you can use the `annotate` to mark a function and specify which obfuscation passes should be applied to that function. Here are some supported pass names along with their corresponding obfuscations.

- indirectcall for indirect call obfuscation
- indirectbr for indirect branch obfuscation
- flattening for flattening obfuscation
- aliasaccess for alias access obfuscation
- boguscfg for bogus control flow obfuscation
- substitution for instruction substitution
- mergefunction for functions merging

For **backend obfuscation**, you need to insert an `asm` statement into the obfuscated function, and its label must be `backend-obfu`. The backend will automatically identify functions with this statement, and then perform backend obfuscation.

An example of a marking function is shown in the following code, where the target function is obfuscated with indirect call ,indirect branch,alias access and backend obfuscation.

```c
int __attribute((__annotate__(("indirectcall,indirectbr,aliasaccess")))) main() {
    asm("backend-obfu");
    printf("Hello World!\n");
    return 0;
}
```



## Examples

We have several examples in the "Examples" directory that demonstrate  how to use Polaris's backend obfuscation and work with Polaris's  IR-based obfuscation. 

Through these examples, you will be able to perceive that adding  obfuscation to your code is a very simple thing.  Moreover, you will also be capable of sensing the threats that  traditional IR-based obfuscation is exposed to and how Polaris resolves  these threats.  

We use `/examples/2/example2` as an example. Part of the source code is shown below.

```C++
class TEA {
public:
    TEA(const std::vector<uint32_t>& key) {
        for (int i = 0; i < 4; ++i) {
            this->key[i] = key[i];
        }
    }
	__attribute((__annotate__(("flatten,boguscfg,substitution"))))
    void encrypt(uint32_t& v0, uint32_t& v1) const {							// function to be obfuscated
    #ifdef BACKEND_OBFU
    	asm("backend-obfu");
	#endif 
        uint32_t sum = 0;
        uint32_t delta = 0x9e3779b9;
        for (int i = 0; i < 32; ++i) {
            sum += delta;
            v0 += ((v1 << 4) + key[0]) ^ (v1 + sum) ^ ((v1 >> 5) + key[1]);
            v1 += ((v0 << 4) + key[2]) ^ (v0 + sum) ^ ((v0 >> 5) + key[3]);
        }
    }
private:
    uint32_t key[4];
};
```



**1.Original Program:**

use command `clang++ example2.cpp -o example2` to get the program without obfuscation. Then we used IDA to analyze the binary file, and we found that function could be easily decompiled into pseudocode, which is very similar to source code. 

![1](/imgs/original_example.png)

**2.Program Obfuscated With OLLVM:**

use command `clang++ example2.cpp -mllvm -passes=sub,bcf,fla -o example2` to get the program obfuscated by OLLVM.  The source code needs to have the **BACKEND_OBFU** macro definition **commented out**. 

By analyzing the generated files with IDA, it can be found that readable pseudocode can still be generated. Moreover, key segments of the code can still be recognized therein.  

![2](/imgs/ollvm_example.png)

By enabling the de-obfuscation tool D810, it can be seen that the obfuscation(`bogus control flow`, `control flow flatten`, `instruction substitution`) of OLLVM can be effectively removed, and the generated  results are very close to the source code.

![3](/imgs/d810_ollvm_example.png)

**3.Program Obfuscated With Polaris:**

use command `clang++ example2.cpp -mllvm -passes=sub,bcf,fla -o example2` to get the program obfuscated by OLLVM and  Polaris' backend obfuscator. It can be observed that the assembly code of the protected function is  displayed in red. This occurs because IDA is unable to recognize this  assembly code as a valid function.

![3](/imgs/backend_obfu_example.png)

Even though attackers force IDA to generate some pseudo code, the output was still wrong and really hard to read. The results are shown in the picture below.![3](/imgs/backend_obfu_example2.png)

The following pictures show the IDA's analysis results for original program and obfuscated program. Most functions of the original program have been identified, shown in blue.![4](/imgs/backend_obfu_example4.png)

On the contrary, the obfuscated program is filled with instructions and data that IDA cannot recognize as functions, shown in red and grey.![5](/imgs/backend_obfu_example3.png)
