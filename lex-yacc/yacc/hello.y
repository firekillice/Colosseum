/* calc.y */
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror();
%}

%token INTEGER
%left '+' '-'
%left '*' '/'
/* %left 表示左结合，%right 表示右结合。 */
/* 最后列出的定义拥有最高的优先权。 运用这个简单的技术，我们可以消除文法的歧义。*/

%%

program:
    program expr '\n' { printf("result: %d\n", $2); }
    |
    ;

expr:
    INTEGER { $$ = $1; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | '(' expr ')'  { $$ = $2;      }
    | { yyerror("invalid input.\n"); }
    ;
/* "$$"表示缩小后的堆栈顶部。$1，$2都是yacc预定义可以直接使用的标记(用相对地址访问内容栈中的值)。 */
/* “$1”代表右式中的第一个成员，“$2”代表第二个，后面的以此类推。*/

%%

void yyerror(char *s)
{
    printf("YACC erro: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}
