%include "./disk_load.asm"
%include "./util.asm"

org 0x7c00
mov bx, HELLO
call print_string

mov bx, BYE
call print_string

jmp $

HELLO:
	db 'Hello,OS!'
BYE:
	db 'GoodBye!'

times 510 - ($ - $$) db 0
dw 0xaa55


