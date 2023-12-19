%{
#include<stdio.h>
int character=0,word=0,sentence=0,inword=0;
%}
%%
[a-zA-Z] {character++;}
[.!?] {sentence++;}
[ \t\n] {if(character>0) word++;}
%%
int yywrap()
{
return 1;
}
int main()
{
yylex();
printf("\nCharacters: %d\n",character);
printf("Words: %d\n",word);
printf("Sentences: %d\n",sentence);
}
