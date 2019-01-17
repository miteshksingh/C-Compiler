extern	_printf

SECTION .text

global _main
_main:

	push    ebp
	mov     ebp,esp

	mov	eax, [i]
	push	eax
     
	mov	eax, 987
	push	eax

	push    dword printtext

	call    _printf
	add     esp, 12		; pop stack: 3 push times, 4 bytes each

	mov     esp, ebp
	pop     ebp
        
	leave
	ret
	
SECTION .data

i: dd 102
printtext: db "Hello, %d, %d\n"

