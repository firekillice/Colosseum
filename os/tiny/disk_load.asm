disk_load:

	mov ah, 0x2	; read function
	mov dl, 0x0	; drive index
	mov ch, 0   ; cylinder
	mov dh, 0   ; head
	mov cl, 0   ; sector
	mov al, 0x2	; sector count

	mov bx, 0xa000
	mov es, bx
	mov bx,0x1234

	int 0x13
