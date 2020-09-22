## 如果提示找不到-lc，则需要安装 yum install glibc-static 
###################################################################
gcc -E main.c -o main.i
#
#		||
#		VV	
#
gcc -S main.i -o main.s
gcc -S main.c -o main.s
#
#		||
#		VV	
#
gcc -c main.s -o main.o
gcc -c main.c -o main.o
as main.s -o main.o
#
#		||
#		VV	
#
gcc -c simple_print.c -o simple_print.o
gcc  -o c_produre main.o simple_print.o
ld main.o simple_print.o -e main -o c_produre # -e 指定程序的入口符号 
