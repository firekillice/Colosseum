%include 'func.asm'

global _start
section .text
	_start:
		mov ecx,99
		
	print_loop:
		cmp ecx, 300
		jz print_finished

		mov eax,ecx
		call iprintLF 	
		inc ecx
		jmp print_loop
	
	print_finished:
		
		mov ebx,2
		mov eax,10
		mul ebx
		call iprintLF
		
		call quit
		
