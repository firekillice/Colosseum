flex c.l
bison -dy c.y
gcc lex.yy.c y.tab.c -o parse -ll

#rm y.tab.c  y.tab.h parse lex.yy.c 
