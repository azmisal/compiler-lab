%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void); 
    void yyerror(char *);
%}

%token int_token float_token char_token id num lbracket rbracket semicolon

%%

program: declaration_list {printf("Valid Declaration");}
       | /* empty */
       ;

declaration_list: declaration_list declaration
               | declaration
               ;

declaration: type_specifier id array_declaration semicolon
           ;

type_specifier: int_token
             | float_token
             | char_token
             ;

array_declaration: lbracket num rbracket
                | /* empty */
                ;

%%

void yyerror(char *str) {
    fprintf(stderr, "Error: %s\n", str);
}

int main() {
    printf("Enter an array declaration:\n");
    yyparse();
    return 0;
}

