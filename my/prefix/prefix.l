%{
#include<string.h>
#include"prefix.tab.h"
%}
%%
"*"|"/"|"+"|"-"|"("|")" {return yytext[0];}
[0-9]+ {yylval.name=(char*)malloc(yyleng+1);
   strcpy(yylval.name,yytext);
   return NUM;}
\n {return(0);}
[a-zA-Z][a-zA-Z]* {yylval.name=(char*)malloc(yyleng+1);
      strcpy(yylval.name,yytext);
      return ID;}
. {}
%%
int yywrap()
{
return 1;
}