%{
#include <stdio.h>

int k = 0;
%}

%%

[0-9]+ {
    k = atoi(yytext);
    if(k % 6 == 0 && k % 8 == 0) {
        printf("%d\n", k);
    }
}
