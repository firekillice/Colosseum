global _start
section .data
	msg db 'Hello,World!', 0Ah
	msglen equ $-msg

section .text
	_start:
		mov ebx,1
		mov ecx,msg
		mov edx,msglen
		mov eax,4
		int 0x80
		
		mov eax,1
		mov ebx,0
		int 0x80
