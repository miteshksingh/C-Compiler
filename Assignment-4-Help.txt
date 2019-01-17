Generate the 80x86 assembly code from your intermediate code (Assignment-3).

Following are the 4 steps:

(0) Understand the 80x86 assembly (either in GAS syntax on NASM
syntax). Experiment, and also go through the wiki page. Basically, you
need only the following features:
    - Registers for regular operations (eax, ebx etc...)
    - Memory read/write (mov etc.)
    - Arithmetic. Here pay special attention to fixed registers for
Multiply and Divide.
    - Boolean AND, OR.
    - Array addressing
    - Compare and Jump

(1) Covert the TAC output to a Quadruple or Triple table.
    - Define a Intermediate Code Table, with 4 (or 3) columns.
    - Where ever you have fprintf currently, populate in the Table
also. Don't remove the fprintf.

(2) Call a function after yyparse (in main) called generate_code().
    - Have exactly this comment at the *END* of your Assignment-3 <file>.y
/* Assignment 4: Code Generation */
    - Define the generate_code function and all supporting functions
*AFTER* this comment. You may have to declare the prototype in the
first section of bison.
    - Let main take another parameter as command line argument
(argv[3]), which contains the output assembly file name. So your
command line will have:
a.exe <file>.c <file>.i <file>.s

*** Ask me if you don't understand this instruction. If any violation,
it will NOT be evaluated. ***

(3) The output <file>.s will contain the following FIVE being
generated in the generate_code() function:

    (3.1) Header of assembly file
        - (in NASM/Win-8 syntax): these 6 lines hardcoded in a single fprintf:
extern  _printf
SECTION .text
global _main
_main:
        push    ebp
        mov     ebp,esp

    (3.2) Scan your quadruple/triple table, and convert EACH TAC into
1+ assembly instructions.
        - Here your knowledge of (0) will help.
        - Most of this is mechanical. Only for TACs of the form t0 = a
< b, you need to do something more. But it is easy...
        - You need not worry about register re-use. You can do the
following 3 for each TAC:
             a. load from memory into register
             b. do operation using this register, and another memory
(or register)
             c. store result from register to memory.

    (3.3) Hardcode the result printing part using a single fprintf.
For this, you can assume that the C program contains the following 3
variables:
        - int "result" contains the result (e.g. sum of elements in an
array, 0 or 1 for searching an element in an array, etc.).
        - The array name is "a", with "size" elements. So print a[0]
to a[size-1].
        - You print these 3 things in order: result, size, a[0], a[1],
..., a[size-1]. All are of type int.

*** Most of you have done the printf part in the lab, so just hardcode
it in a single fprintf. ***

    (3.4) Footer of the assembly file:
        - (in NASM/Win-8 syntax): these 4 lines hardcoded in a single fprintf
mov esp, ebp
pop ebp
mov eax, 0
ret

    (3.5) The symbol table:
        - (in NASM/Win-8 syntax): first have these 2 lines hardcoded
using a single fprintf.
SECTION .data
printtext: dd "%d", 10, 0

*** Using only %d, because you just need to print ints in (3.3). The
10, 0 are for NEW_LINE and NULL_TERMINATION ***

        - Then have all variables from symbol table, according to
their type, initial value etc. For this you need to see the syntax of
variable declaration.
