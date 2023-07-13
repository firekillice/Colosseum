%include 'func.asm'

global _start
section .text
	_start:
		mov eax,0
		mov ecx,0
		
	print_loop:
		cmp ecx,10
		jz print_finished

		mov eax,ecx
		add eax,48
		call sprintCharWithLine 	
		inc ecx
		jmp print_loop
	
	print_finished:
		call quit
		
