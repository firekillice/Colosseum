#############################################
# hello
hello: hello.txt

hello.txt:
		ls
		touch hello.txt
		#ls;touch hello.txt
dummy: 
	ls

#############################################
# variant
newfiles = a.txt b.txt c.txt

batch: $(newfiles)
	ls
	-rm -rf  *.txt

a.txt: 
	touch a.txt
b.txt:
	touch b.txt
c.txt:
	touch c.txt
#############################################
objects := $(patsubst %.c,%.o,$(widecard *.c))
foo: $(objects)
	gcc -o foo $(objects)
#############################################
##  automatic deduction
main: add.o dec.o main.o
	$(CC) -o main add.o dec.o main.o
#############################################
.PHONY: clean
clean:
	-rm *.txt
