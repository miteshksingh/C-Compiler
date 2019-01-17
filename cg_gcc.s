
.text
                 
.globl _main
_main: 

	pushl	%ebp
	movl	%esp, %ebp

	//movl $i, %ebx
	//movl	(%ebx), %eax
	/* Either above 2 lines, or below 1 line achieve the same thing */
	movl	i, %eax

	movl	%eax, 8(%esp)

	movl $987, %eax
	movl %eax, 4(%esp)

	movl $printtext, (%esp)
	call _printf

	movl %ebp, %esp
	popl %ebp

	leave
	ret
	
.data

i: .long 102
printtext: .ascii "Hello, %d, %d\n"
