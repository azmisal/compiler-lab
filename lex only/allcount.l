%{
#include<stdio.h>
#include<string.h>
char keywords[100][100],integers[100][100];
char iden[100][100],separators[100][100],floating[100][100];
int key=0,id=0,sep=0,in=0,ft=0;
%}
%%
int|float|char|break|case|while|return|do|for|continue|double|else|
if|long|sizeof|struct|switch|void {strcpy(keywords[key++],yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {strcpy(iden[id++],yytext);}
[0-9][0-9]* {strcpy(integers[in++],yytext);}
[0-9]+[.][0-9]+ {strcpy(floating[ft++],yytext);}
[()*-+{}|,;<>/.=] {strcpy(separators[sep++],yytext);}
[ \n\t]+ {}
%%
int yywrap(){}
int main()
{
printf("Enter string: ");
yylex();
int i;
i=0;
printf("\n Keywords are: %d\n",key);
while(i<key) printf("%s \n",keywords[i++]);
i=0;
printf("\n Identifiers are: %d\n",id);
while(i<id) printf("%s \n",iden[i++]);
i=0;
printf("\n Separators are: %d\n",sep);
while(i<sep) printf("%s \n",separators[i++]);
i=0;
printf("\n Integers are: %d\n",in);
while(i<in) printf("%s \n",integers[i++]);
i=0;
printf("\n Floats are: %d\n",ft);
while(i<ft) printf("%s \n",floating[i++]);
}