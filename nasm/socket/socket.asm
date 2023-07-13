;https://www.scip.ch/en/?labs.20200521
create_socket:
	push ebx
	push ecx
	push byte 6	; IPPROTO_TCP
	push  byte 1	; SOCK_STREAM
	push  byte 2	; PF_INET
	mov ecx,esp
	mov ebx, 1    ; socket 1	
	mov eax, 102
	int 0x80	
	
	pop ecx
	pop	ecx
	pop	ecx
	pop ecx
	pop ebx
 
	ret

bind_socket:
	push edi
	push ecx
	push ebx

	mov edi,eax	
	
	;push byte 1		; 4byte
	push dword 0		; 4byte, 0.0.0.0
	push word 0xbeef	; be 2byte 61374
	push word 2			; 2byte AF_INET
	
	mov ecx,esp			; save address struct
	
	push byte 16		; size of sockaddr_in struct
	push ecx
	push edi
	mov ecx,esp
	mov ebx,2
	mov eax,102
	int 0x80
		
	pop edi
	pop ecx
	pop ecx
	pop ecx
	pop ecx

	pop ebx
	pop ecx
	pop edi

	ret

listen_socket:
	push ecx
	push ebx

	push byte 10
	push eax
	mov ecx,esp
	mov ebx,4
	mov eax,102
	int 0x80
	
	pop ecx
	pop ecx
	pop ebx
	pop ecx
	
	ret

accept_socket:
	push ecx
	push ebx	

	push byte 0
	push byte 0
	push eax
	mov ecx,esp
	mov ebx,5
	mov eax,102
    int 0x80
	
	pop ecx
	pop ecx
	pop ecx
	
	pop ebx
	pop ecx
	
	ret

read_socket:
	push ebx
	push ecx
	push edx

	mov ebx,eax
	mov ecx,buffer
	mov edx,255	
	mov eax,3
	int 0x80
	
	pop edx
	pop ecx
	pop ebx
	ret


write_socket:
	push edx
	push ecx
	push ebx

	mov edx,eax
	
	mov eax,response
	call strlen
	mov ecx,eax
		
	mov ebx,edx
	mov edx,ecx
	mov ecx,response
	mov eax,4
	int 0x80
	
	pop ebx
	pop ecx
	pop edx
	ret


close_socket:
	push ebx

	mov ebx,eax
	mov eax,6
	int 0x80
	
	pop ebx
	ret
