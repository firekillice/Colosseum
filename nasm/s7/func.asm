;------------------------------------------
strlen:
	push ebx
	mov ebx,eax
loop:
	cmp byte [eax], 0
	jz finished
	inc eax
	jmp loop

finished:
	sub eax,ebx
	pop ebx
	ret

;------------------------------------------
sprint:
	push ebx
	push ecx
	push edx
	mov ebx,eax
	call strlen
	mov edx,eax
	mov ecx,ebx
	mov ebx,1
	mov eax, 4
	int 0x80
	
	pop edx 
	pop ecx
	pop ebx
	ret
;------------------------------------------
sprintLN:
	call sprint
	push eax
	
	mov eax, 0xA
	push eax
	mov eax, esp
	call sprint
	pop eax
	pop eax
	ret

;------------------------------------------
sprintCharWithLine:
	push eax
	mov eax,esp
	call sprint
	pop eax

	push 0xa
	mov eax,esp
	call sprint
	pop eax

	ret
;------------------------------------------

quit:
	mov eax,1
	mov ebx,0
	int 0x80
	ret
