%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);

extern int yylineno;

%}

%union {
    int int_val;
}

%token <int_val> TOK_NUMBER
%token TOK_ADD TOK_SUB TOK_MUL TOK_DIV TOK_OPEN_PARA TOK_CLOSE_PARA TOK_STOP TOK_NEWLINE

%type <int_val> expression term factor statement

%left TOK_ADD TOK_SUB
%left TOK_MUL TOK_DIV

%%

statements:
     statement TOK_NEWLINE { printf("Result: %d\n", $1); }
    | statement TOK_STOP { printf("Result: %d\n", $1); printf("Program parsed!\n"); exit(0); }
    ;


statement:
    expression { $$ = $1; }
    ;


expression:
    term { $$ = $1; }
    | expression TOK_ADD term { $$ = $1 + $3;}
    | expression TOK_SUB term { $$ = $1 - $3;}
    ;

term:
    factor { $$ = $1; }
    | term TOK_MUL factor { $$ = $1 * $3; }
    | term TOK_DIV factor { $$ = $1 / $3;}
    ;

factor:
    TOK_NUMBER { $$ = $1;}
    | TOK_OPEN_PARA expression TOK_CLOSE_PARA { $$ = $2; }
    ;

%%

int main() {
    printf("Simple Calculator\n");
    printf("Enter expressions (e.g., 2 + 3 * 4), press Ctrl+C to exit:\n");

    while (1) {
        yyparse();  // Call Bison parser function
    }

    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d\n", s, yylineno);
}
