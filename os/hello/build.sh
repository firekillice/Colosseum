nasm -f bin os_show.asm -o show
nasm -f bin hello.asm -o hello
od -t x1 -A x show 
