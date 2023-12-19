
%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<unistd.h>
    int yylex(void); 
    void yyerror(char *);
%}

%token A
%token B
%token C
%token END
%token ERR

%%

line:
    expl expr END { printf("Valid string\n"); YYACCEPT; }
	| error END { printf("Invalid string\n"); YYACCEPT; }
	;

expl: A expl B  
    |
;
expr: B B expr C  
    |
;

%%

void yyerror(char *s) { 
	fprintf(stderr, "%s\n", s);  
} 
int main(void) { 
	yyparse(); 
	return 0; 
}


