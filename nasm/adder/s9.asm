%include 'func.asm'

global _start
section .text
	_start:
	pop ecx
	pop edx
	dec ecx

	mov ebx,0
	.read_input_loop:
		cmp ecx,0
		jz .finished
		pop eax	
		call newatoi
		add ebx,eax
		dec ecx
		cmp ecx,0
		jnz .read_input_loop
	.finished:
		mov eax,ebx
		call iprintWithLine
		call quit
