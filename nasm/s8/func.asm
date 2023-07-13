;------------------------------------------
strlen:
	push ebx
	mov ebx,eax
strlen_loop:
	cmp byte [eax], 0
	jz strlen_finished
	inc eax
	jmp strlen_loop

strlen_finished:
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
	call sprintCharWithoutLine

	push 0xa
	mov eax,esp
	call sprint
	pop eax

	ret
;------------------------------------------
sprintCharWithoutLine:
	push eax
	mov eax,esp
	call sprint
	pop eax

	ret
;------------------------------------------
iprintLF:
	push edx
	push ecx
	push esi	

	mov ecx,0
	mov esi,10

devide_loop:
	inc ecx
	mov edx,0
	idiv esi
	push edx
	cmp eax,0
	jnz devide_loop

iprint_loop:
	cmp ecx,0
	jz iprint_finished
	pop eax
	add eax,48
	call sprintCharWithoutLine
	dec ecx
	jmp iprint_loop
	
iprint_finished:
	mov eax,0xa
	call sprintCharWithoutLine

	pop edi
	pop ecx
	pop edx
	mov eax,0
	ret

;------------------------------------------
quit:
	mov eax,1
	mov ebx,0
	int 0x80
	ret
