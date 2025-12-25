org 0x7c00

jmp Entry

%include "./disk_load.asm"
%include "./util.asm"

Entry:
	call clean_screen
	call set_cursor
	mov si, HELLO
	call print_string

	call disk_load

	mov si, BYE
	call print_string
	
	jmp $

HELLO:
	db 'Hello,OS!',0x0a,0x0d,0
BYE:
	db 'GoodBye!',0

times 510 - ($ - $$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface
