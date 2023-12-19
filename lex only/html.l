%{
#include<stdio.h>
%}
%%
"<"[^>]+">" {}
[^<]+ {printf("%s",yytext);}
%%
int yywrap(){}
int main()
{
yylex();
}