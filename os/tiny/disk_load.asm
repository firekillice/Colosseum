disk_load:
	
	mov ah, 0x2	; read function
	mov dl, 0x0	; drive index
	mov ch, 0   ; cylinder
	mov dh, 0   ; head
	mov cl, 2   ; base 1, skip MBR sector
	mov al, 1	; sector count

;	mov bx, 0xa000
;	mov es, bx
;	mov bx,0x1234

	int 0x13
	
	;mov si, DISK_ERROR_MSG
	;call print_string	
	ret

	jc disk_error
	
	mov dl,1
	cmp dl, al
	jne disk_error
	ret

disk_error:
	mov si,DISK_ERROR_MSG
	call print_string
	jmp $


DISK_ERROR_MSG:
    db "Disk read error!", 0xa, 0xd, 0
