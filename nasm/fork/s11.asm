%include 'func.asm'
section .data
	child_msg db 'This is a child.', 0
	parent_msg db 'This is a parent',0

	timeStamp_msg db 'current timestamp: ', 0

global _start
section .text
	_start:
		mov eax,2
		int 0x80
		cmp eax,0
		jz child_ret
		mov eax, parent_msg
		call sprintWithLine 

		mov eax,timeStamp_msg
		call sprint
		mov eax,13
		int 0x80
		call iprintWithLine
		
		call quit
		
		
	child_ret:
		mov eax,child_msg
		call sprintWithLine
		call quit
		
