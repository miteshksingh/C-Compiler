# C-Compiler


A small C Compiler which can handle simple sorting programs. This is just a basic compiler for preliminary anaysis of all phases of Compiler Design. The .l file generates tokens from input C program and passes to .y file which deals with the syntactic and semantic phases.An intermediate code is generated.This intermediated code is then stored in quadruple table. All statements from quadruple table are converted into assembly instructions in GCC AT&T Syntax. 

Knowing how the most rudimentary constructs like loops, function calls and variable declaration are mapped into assembly language helps to understand C internals. Compilers for high level language like C/C++ have the ability to translate high level language into assembly language. Unlike C language, there are variations w.r.t the 80x86 assembly syntax. The GNU C and C++ compiler option of -S will generate an assembly code equivalent to that of the corresponding source program.  By default, GCC makes the assembler file name by replacing the suffix '.c' with '.s'. This generates .s file which can be successfully executed to give desired output of input program.

GCC Compilation Order
1. preprocessing (.i-file)
2. compiling(.s-file)
3. assembling(.o-file) - This is the object file. 
4. linking (.exe-file) - Linker takes the object files and links it with other object files to produce executable file

Please read here to know more about GCC Compilation Order - https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html

Dependencies:Flex(Lecaical Analyser),Bison(Parser Generator Tool)

# How to execute:

1. Install flex and Bison and set their path.

2. flex Compiler.l

3. bison Compiler.y

4. gcc Compiler.tab.c

5. a.exe .c .i .s

6. gcc -m32 .s

7. a.exe

# Output:

The output will print all the grammer rules needed to parse the input C program. A Symbol table containing all variables is displayed. A Quadruple table used in generating intermediate code is also displayed. The Output of input C program is displayed.

# Constructs supported by the compiler

1.Simple Variable declaration and initialization.

2.Any Dimension Array declaration and initialization. (Error on Redeclaration,Undeclaration,Dimension Mismatch,etc.)

3.If Else Constructs

4.While Loop Constucts(Simple Sorting Programs)
