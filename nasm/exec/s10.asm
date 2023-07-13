%include 'func.asm'
section .data
	command db '/bin/ls', 0
	command_arg1 db '-la', 0

	arguments dd command
			 dd command_arg1
			 dd 0

	environments  dd 0

global _start
section .text
	_start:
		mov eax,0xb
		mov ebx,command
		mov ecx,arguments
		mov edx,environments
		int 0x80
		call quit
