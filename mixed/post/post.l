%{
#include "post.tab.h"
%}

%%
[ \t]              ; // skip whitespace
[0-9]+               { yylval = atoi(yytext); return NUM; }
\n                     {return END;}
[-+*/()^]            { return yytext[0]; }
.                    ; //{ fprintf(stderr, "Invalid character: %s\n", yytext); }

%%

int yywrap() {
return 1;
}