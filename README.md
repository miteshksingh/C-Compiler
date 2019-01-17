# C-Compiler


A mini-gcc compiler which can handle simple sorting programs. This is a basic compiler for preliminary anaysis of all phases of Compiler Design. The .l file generates tokens from input C program and passes to .y file which deals with the syntactic and semantic phases. An intermediate code is generated. This intermediated code is then stored in quadruple table. All statements from quadruple table are converted into assembly instructions in GCC AT&T Syntax. 

Knowing how the most rudimentary constructs like loops, function calls and variable declaration are mapped into assembly language helps to understand C internals. Compilers for high level language like C/C++ have the ability to translate high level language into assembly language. Unlike C language, there are variations w.r.t the 80x86 assembly syntax. The GNU C and C++ compiler option of -S will generate an assembly code equivalent to that of the corresponding source program.  By default, GCC makes the assembler file name by replacing the suffix '.c' with '.s'. This generates .s file which can be successfully executed to give desired output of input program.

GCC Compilation Order
1. preprocessing (.i-file) - Macro substitution, comments are stripped off and Exapansion of the included files
2. compiling(.s-file) - Compiler takes .i file as input, compiles it and produces an intermediate compiled output
3. assembling(.o-file) - Assembler converts .s file with assembly instructions into .o object file with machine level instructions. Only the existing code is converted into machine language, the function calls like printf() are not resolved.
4. linking (.exe-file) - Linker takes the object files and links it with other object files to produce executable file

Please read here to know more about GCC Compilation Order
https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html

https://www.thegeekstuff.com/2011/10/c-program-to-an-executable/

Note:
In the compiling step, we can generate 2 types ASM files - gcc ASM file and nasm ASM file. Both assembly syntax is valid for 80x86 processor. We generate the GCC AT&T syntax.

Dependencies:Flex(Lexical Analyser),Bison(Parser Generator Tool)

# Developing a mini-gcc compiler from end to end

## Assignment-1: Building a Lexical Analyzer for C

## Assignment-2: Building Syntx Analyzer for C and sybmol table for all identifiers
##### Part-A: Building a Syntax Analyzer(parser) for C using the bison parser-generator and the grammar given in K & R (pp.234-238)

Input: A C program (argv[1])

Output: On the screen, a sequence of productions being reduced. i.e. Rightmost derivation in Reverse.

##### Part-B: Construct a Symbol Table for all the identifiers appearing in the input C-program.

Input: A C-program as earlier (argv[1])

Output:
    - print error message and exit on duplicate declarations
    - print error message and exit on usage without declarations
    - if no error, print the symbol table after the parse is complete.
The symbol table should contain these FIVE information for each
identifier: name, type, line number of declaration, size (1 for
non-arrays), initial value if any.


## Assignment-3: Intermediate Code Generation
Input: A C-file
Output: An intermediate code file, if there are no syntax errors, or
errors caught due to various checking (lvalue, etc.)

##### Part-A: Expressions:

    A.1 Assignment expressions, operators: =, +, -, *, /
    A.2 joint assignment-operator expressions: +=, -= *=, /=
    A.3 Post-increment: ++, --
    A.4 Pre-increment: ++, --
    A.5 Unary Minus: -

##### Part-B: Arrays:

    B.1: Multi-dimension array declaration
    B.2: Array usage on right side: val = arr[index];
    B.3: Array usage on left side: arr[index] = val;

##### Part-C: Control Constructs:

    C.1: If, else
    C.2: while loop
      
## Assignment-4: Generate the 80x86 assembly code from your intermediate code

# Constructs supported by the compiler

1. Simple variable declaration and initialization.

2. Any dimension array declaration and initialization. (Error on redeclaration, undeclaration, dimension Mismatch, etc.)

3. If else constructs

4. While loop constucts(simple sorting programs)

# How to execute:

1. Install flex and bison and set their path.

System setup: 1 of the following 3 options:
(1) Install Linux (Ubuntu) on your system
(2) Install Cygwin on top of your Windows. http://cygwin.org/. If you
have unlimited net access, you can get this.
(3) Install Flex/Bison for Windows:
http://gnuwin32.sourceforge.net/packages/flex.htm,
http://gnuwin32.sourceforge.net/packages/bison.htm.

For (1) and (2), "gcc" will be there.
If you already have a Windows system, (3) seems to be least
disruptive. 
If you have a Mac system, install Xcode development suite. It comes
along with the Mac (not installed but in a DVD), and is also freely
available on their website.


2. flex Compiler.l

3. bison Compiler.y

4. gcc Compiler.tab.c (This generates my compiler executable: a.exe)

5. a.exe .c .i .s (<my-compiler-executable> <file>.c <file>.i <file>.s) 

6. gcc -m32 .s

7. a.exe

# Output:

The output will print all the grammer rules needed to parse the input C program. A symbol table containing all variables is displayed. A quadruple table used in generating intermediate code is also displayed. The output of input C program is displayed.

# List of References

(1) Compilers: Principles, Techniques and Tools: Aho, Lam, Sethi,
Ullman. http://www.flipkart.com/compilers-principles-techniques-tools-2/p/itmdytt9apzffgwc?pid=9788131721018&otracker=from-search&srno=t_1&query=Aho+monica+lam+compilers&ref=0dfeb090-ad96-430a-95b7-28610d4370ca
    Course will deal with first 600 pages.

(2) The C Programming Language K & R: pp191-240. The PDF is attached.
The page# refers to the book (not the PDF). Take a printout of this
and keep.

(3) Flex tool: http://dinosaur.compilertools.net/flex/index.html,
http://flex.sourceforge.net/manual/

(4) Bison tool: http://dinosaur.compilertools.net/bison/index.html,
http://www.gnu.org/software/bison/bison.html
