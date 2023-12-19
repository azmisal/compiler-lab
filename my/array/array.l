%{
#include "array.tab.h"

%}

%%
int return int_token;
float return float_token;
char return char_token;
[a-z]+ return id;
[0-9]+ return num;
"[" return lbracket;
"]" return rbracket;
";" return semicolon;
[ \t\n] /* Ignore whitespace */
. return yytext[0];
%%

int yywrap() {
    return 1;
}

