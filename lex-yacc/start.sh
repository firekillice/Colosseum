docker build . -t lex:v0

docker run -it -v `pwd`/examples:/app --rm lex:v0 /bin/bash

#lex *.lex
#gcc lex.yy.c -o test -ll

#yacc calc.y -d
#lex calc.lex
#gcc lex.yy.c y.tab.c -o calc -ll
