gcc -O1 -S sum.c -o sum-O1.s
gcc -S sum.c -o sum.s
## 编译
#gcc -O1 -c sum.c
gcc  -c sum.c
## 反编译
objdump -d sum.o 
