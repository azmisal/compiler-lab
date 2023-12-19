%{
#include<stdio.h>
%}
dig[0-9]
sign[+-]
exp[Ee]
neg[-]
realnum({sign}?{dig}+(\.{dig}+)?({exp}{sign}?{dig}+)?)
%%
{realnum} { printf("Real Number: %s\n",yytext); }
.|\n { }
%%
int yywrap(){}
int main()
{
printf("Enter the string: ");
yylex();
}