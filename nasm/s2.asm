global _start
section .data
	msg db 'Hello,World!', 0Ah
	msglen equ $-msg

section .text
	_start:
		mov ebx, msg
	_loop:
		cmp byte [ebx], 0
		jz _finish
		inc ebx
		jmp _loop

	_finish:
		sub ebx,msg
		mov edi,ebx
	
		mov edx,ebx
		mov ecx,msg
		mov ebx,1
		mov eax,4
		int 0x80

		mov eax,1
		mov ebx,0
		int 0x80
