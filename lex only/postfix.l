%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define STACK_SIZE 100
int stack[STACK_SIZE];
int top = -1;
int evaluate(char op, int a, int b) {
 switch (op) {
 case '+': return a + b;
 case '-': return a - b;
 case '*': return a * b;
 case '/': return a / b;
 default: return 0;
 }
}
%}
%%
[0-9]+ { stack[++top] = atoi(yytext); }
[-+\*/] { int b = stack[top--]; int a = stack[top--];
stack[++top] = evaluate(yytext[0], a, b); }
" " ; /* Skip whitespace */
\n { printf("Result: %d\n", stack[top]); top = -1;
} /* Print result and reset stack */
. ;
%%
int yywrap() { }
int main() {
 yylex();
 return 0;
}