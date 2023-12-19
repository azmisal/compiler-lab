%{
#include <stdio.h>
#include <stdlib.h>
int yylval;
%}
%%
[0-9]+ { yylval = atoi(yytext); return 'NUMBER'; }
" " ; /* Skip whitespace */
[\t\n] ; /* Skip tabs and newlines */
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
. { return yytext[0]; }
%%
int yywrap(){}
int main() {
 int token;
 int result = 0;
 while ((token = yylex()) != 0) {
 if (token == 'NUMBER') {
 result = yylval;
 } else if (token == '+') {
 token = yylex();
 if (token == 'NUMBER') {
 result += yylval;
 }
 } else if (token == '-') {
 token = yylex();
 if (token == 'NUMBER') {
 result -= yylval;
 }
 } else if (token == '*') {
 token = yylex();
 if (token == 'NUMBER') {
 result *= yylval;
 }
 } else if (token == '/') {
 token = yylex();
 if (token == 'NUMBER' && yylval != 0) {
 result /= yylval;
 }
 }
 }
 printf("Result: %d\n", result);
}