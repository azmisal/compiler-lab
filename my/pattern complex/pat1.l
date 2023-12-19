%{
    #include "pat1.tab.h"
%}


%%
a {return A;}
b {return B;}
c {return C;}
\n {return END;}
[^abc\n] {return ERR;}

%%

int yywrap(){
    return 1;
}
// a^m b^m+2n c^n











