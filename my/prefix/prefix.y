%{
#include<stdio.h>
#include<string.h>
char buf[10];
int yylex(void); 
void yyerror(const char *);
%}

%union
{
  char *name;
}
%token<name>NUM ID
%type<name>E 
%left'+''-'
%left'*''/'
%nonassoc UMINUS
%%
S:E  {printf("\n%s",$1);}
;
E:E''E {buf[0]='\0';$$ = strdup(strcat(strcpy(buf,""),strcat($1,$3)));}
|E'/'E {buf[0]='\0';$$ = strdup(strcat(strcpy(buf,"/"),strcat($1,$3)));}
|E'+'E {buf[0]='\0';$$ = strdup(strcat(strcpy(buf,"+"),strcat($1,$3)));}
|E'-'E {buf[0]='\0';$$ = strdup(strcat(strcpy(buf,"-"),strcat($1,$3)));}
|ID
|NUM
|'('E')'{$$ = strdup($2);}
;
%%
void yyerror(const char *s) {
  fprintf(stderr,"%s\n",s);
}

int main()
{
    yyparse();
    return 0;
}
