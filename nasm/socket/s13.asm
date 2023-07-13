%include 'func.asm'
%include 'socket.asm'

section data
	response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 14', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello World!', 0Dh, 0Ah, 0h

section .bss
	buffer resb 255	
	
global _start
section .text
	_start:
		xor eax,eax
		xor ebx,ebx
		xor edi,edi
		xor esi,esi
		
	_socket:
		call create_socket
		mov ecx,eax
		call bind_socket
		mov eax,ecx
		call listen_socket
		mov eax,ecx

	_accept_loop:
		call accept_socket
		mov edx, eax

		call fork
		cmp eax, 0
		jz _try_read

		mov eax,ecx
		jmp _accept_loop
				
	_try_read:
		mov eax,edx
		call read_socket
		
		mov eax,buffer
		call sprint

		mov eax,edx
		call write_socket

		mov eax,edx
		call close_socket

	call quit		
