%{
#include <stdio.h>
%}

%%
[0-9]+          { printf("Number: %s\n", yytext); }
[a-zA-Z]+       { printf("Letter: %s\n", yytext); }
.               ; /* 忽略其他字符 */
%%

int main() {
    yylex();
    return 0;
}
