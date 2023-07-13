create_file:
	push ecx
	push ebx
	
	mov ebx,eax
	mov eax,0x8	
	mov ecx,0777o
	int 0x80
	
	pop ebx
	pop ecx
	ret


write_file:
	push edx

	push eax
	mov eax,ebx
	call strlen
	mov edx,eax
	pop eax

	mov ecx,ebx
	mov ebx,eax
	mov eax,4
	int 0x80

	pop edx
	ret


open_file:
	push ecx

	mov ecx,0
	mov ebx,eax
	mov eax,5
	int 0x80

	pop ecx
	ret


read_file:
	push ecx
	push edx

	mov ecx,fileContents
	mov edx,255
	mov ebx,eax
	mov eax,3
	int 0x80
	
	pop edx
	pop ecx
	ret


close_file:
	push ebx
	mov ebx,eax
	mov eax,6
	int 0x80
	pop ebx
	ret


delete_file:
	push ebx
	mov ebx,eax
	mov eax,10
	int 0x80
	pop ebx
	ret
