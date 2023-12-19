%{
#include<stdio.h>
%}
%option noyywrap
%s COMM SL_COMM
%%
<INITIAL>"/*" { BEGIN COMM; }
<COMM>"*/" { BEGIN INITIAL; }
<COMM>. {}
<INITIAL>"//" { BEGIN SL_COMM; }
<SL_COMM>\n { BEGIN INITIAL; }
<SL_COMM>. {}
. { ECHO; }
%%
int main()
{
yylex();
}