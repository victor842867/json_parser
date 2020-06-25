
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%
[\[] {
  return '[';
  }

[\]] {
    return ']';
    }

[\"] {
    return '"';
    }

[\,] {
    return ',';
    }

[0-9]+ {
    return  NUMERO;
    }

[a-zA-Z]+ {
    return STRING;
    }

[[:space:]]+

. {yyerror("token desconhecido\n");}

%%
int yywrap() {
  return 1;
}
