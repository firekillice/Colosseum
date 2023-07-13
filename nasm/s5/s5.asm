%include 'func.asm'

global _start
section .text
	_start:
		pop ecx
	loop_cmd_args:
		cmp ecx,0
		jz loop_finished
		pop eax
		call sprintLN
		dec ecx
		jmp loop_cmd_args
	loop_finished:
		call quit
