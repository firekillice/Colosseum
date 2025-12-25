print_string:
.read_cursor:
	mov ah, 0x03
	xor bh, bh
	int 0x10

	mov cx, 0
	mov bx, si
.length:
	mov al, [bx]
	add bx, 1
	cmp al, 0
	je .print
	add cx, 1
	jmp .length

.print:
	mov bx, si
	mov bp, bx
	
	mov ah, 0x13
	mov al, 0x01	; text output mode
	mov bh, 0		; page number
	mov bl, 0x1f	; string color
	;mov dh, 0		; row number
	;mov dl, 0		; column number	

	int 0x10
	ret

clean_screen:
	mov ah, 0x6
	mov al, 0		; 0: clean
	mov cx, 0
	mov dx, 0xffff
	mov bh, 0x17	; white text, blue background

	int 0x10
	ret

set_cursor:
	mov ah, 0x02
	mov bh, 0x0
	mov dx, 0x0
	int 0x10
	ret
