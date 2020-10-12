as -o main.o main.S
ld -o main.out main.o
./main.out
rm  main.o main.out -rf
