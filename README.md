# Polairs-Obfuscator

Polairs-Obfuscator is a code obfuscator based on LLVM 16.0.6.This project contain several IR-based obfuscation passes which can transform the code into a more complex form in the IR level (or assemble level) while preserving the original code's semantics. Polaris uniquely offers backend obfuscation based on MIR to protect software from decompilation. Using this obfuscator to compile code can prevent you code from being cracked.

## Features

Compared with the OLLVM framework, this framework not only provides obfuscation based on LLVM IR, but also provides obfuscation based on MIR.

### 0x1 IR Level

- **Alias Access**:  Using pointer aliases to access local variables.
- **Flattening**: Control flow flattening enhanced (resist local symbol execution).
- **Indirect Branch**: Using registers for indirect jumps to other basic blocks.
- **Indirect Call**:  Using registers for indirect function calls.
- **String Encryption**: Encrypt global constants in the program and decrypt them within functions that use these constants.(instead of .ctor)
- **Bogus Control Flow**： Bogus Control Flow (using local variables)

### 0x2 MIR Level

- **Backend obfuscation**


## Build

Download the complete LLVM-16.0.6 project and copy the llvm folder from src into the LLVM project directory.

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

### Command

Use this command: ``clang -mllvm -passes=<obfuscation passes> <source file> -o <target>   `` to compile ``<source file>`` with ``<obfuscation passes> ``  enabled.

here are some supported pass's names:

- **fla**: enable flattening obfuscation
- **gvenc**:  enable global variable(string) encryption obfuscation
- **indcall**: enable indirect call obfuscation
- **indbr**: enable indirect branch obfuscation
- **alias**: enable alias access obfuscation
- **bcf**: enable bogus control flow obfuscation

Enabling multiple obfuscation passes is supported,  you should separate pass names with commas.

for example:

```
clang -mllvm -passes=fla,indcall test.cpp -o test
```

this command will enable flattening obfuscation and indirect call obfuscation while compiling.

### Annotation

After enabling the pass, you need to mark functions in your source as follows to inform the obfuscation pass which functions should be obfuscated.

- indirectcall for indcall
- indirectbr for indbr
- flattening for fla
- aliasaccess for alias
- boguscfg for bcf

```c
int __attribute((__annotate__(("indirectcall,indirectbr,aliasaccess")))) main() {
    asm("backend-obfu");
    printf("Hello World!\n");
    return 0;
}
```

## Examples

