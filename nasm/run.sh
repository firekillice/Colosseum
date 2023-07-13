#!/bin/bash

if [ -f ./a.out ]
then
	rm -rf ./a.out
fi
rm core.* -rf

TARGET=$1
nasm -felf32 $TARGET.asm && ld -g -melf_i386 $TARGET.o && ./a.out

rm *.o
