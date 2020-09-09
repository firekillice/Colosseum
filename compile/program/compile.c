gcc -O1 sum.c
gcc -O1 -o prog sum.o main.c
objdump -d prog
