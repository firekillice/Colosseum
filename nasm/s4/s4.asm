%include 'func.asm'

global _start
section .data
	msg1 db 'hello world', 0Ah,0h
	msg2 db 'sprint with line feed', 0Ah,0h
	msg3 db 'sprint without line feed',0H
section .text
	_start:
		mov eax, msg1
		call sprint

		mov eax, msg2
		call sprint
		
		mov eax, msg3
		call sprintLN
	
		call quit
