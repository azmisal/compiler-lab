%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

#define MAX_SIZE 100

char postfix[MAX_SIZE];
//int postfix_index = 0;

%}

%token NUM END
%left '+' '-'
%left '*' '/'
%right '^'

%%

S : E END {
    printf("Postfix expression: %s\n", postfix);
    return 0;
}

E : E '+' E { strcat(postfix, "+ "); }
  | E '-' E { strcat(postfix, "- "); }
  | E '*' E { strcat(postfix, " "); }
  | E '/' E { strcat(postfix, "/ "); }
  | E '^' E { strcat(postfix, "^ "); }
  //| '(' E ')' {}
  | NUM { sprintf(postfix + strlen(postfix), "%d ", $1); }
 
  ;

%%

int main() {
    printf("Enter the infix expression:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}