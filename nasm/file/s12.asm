%include 'func.asm'
%include 'file.asm'
section .data
	filename db 'test.txt', 0
	filecontent db 'this a first asm file.',0xa,0

section .bss
	fileContents resb 255,          ; variable to store file contents

global _start
section .text
	_start:
		mov eax,filename
		call create_file

		mov ebx,filecontent
		call write_file

		mov eax,filename
		call open_file
		push eax
		call iprintWithLine
		
		pop eax
		call read_file	
		mov eax, fileContents
		call sprint
		
		mov eax,filename
		call delete_file

		call quit
