%{
#include "parser.tab.h"
#include<stdio.h>
#include<string.h>
%}

%%

[0-9]+ {yylval.int_val = atoi(yytext); return TOK_NUMBER;}
"STOP" {return TOK_STOP;}
"+" {return TOK_ADD;}
"-" {return TOK_SUB;}
"*" {return TOK_MUL;}
"/" {return TOK_DIV;}
"(" {return TOK_OPEN_PARA;}
")" {return TOK_CLOSE_PARA;}
[ \t\r]+ {/* Ignore whitespaces */}
\n {yylineno++; return TOK_NEWLINE;}

. {printf("Invalid token: %s\n", yytext);}

%%

int yywrap() {
    return 1;  // Terminate input reading
}
