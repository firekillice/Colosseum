%include 'func.asm'

section .data
	input_tip  db 'Please input your name: ',0h
	hello_msg   db 'hello, ',0h

section .bss
	input_name:   resb 255

global _start
section .text
	_start:
		mov eax, input_tip
		call sprintLN
		
		mov eax, 3
		mov ebx, 0
		mov ecx, input_name
		mov edx, 255
		int 0x80
		
		mov eax,hello_msg
		call sprint

		mov eax,input_name
		call sprint

		call quit
