;------------------------------------------
newatoi:
	push ebx
	push edx
	push esi

	mov ebx,eax
	mov eax,0
	mov edx,0
		
.loop:
	mov dl,[ebx]
	sub dl,48
	add eax,edx
	
	mov esi,10
	mul esi
	
	inc ebx
	mov dl,[ebx]
	cmp dl,0
	jnz .loop
	
	mov esi,10
	div esi
	
	pop esi
	pop edx
	pop ebx
	ret


;------------------------------------------
strlen:
	push ebx
	mov ebx,eax
.loop:
	cmp byte [eax], 0
	jz .finished
	inc eax
	jmp .loop

.finished:
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
sprintWithLine:
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
iprintWithLine:
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

;------------------------------------------
fork:
	mov eax,2
	int 0x80
	ret
