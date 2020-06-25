
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%
[{] {
    return '{';\
    }

[}] {
    return '}';
    }

[[] {
    return '[';
    }

[]] {
    return ']';
    }

[\:] {
    return ':';
    }

[\,] {
    return ',';
    }

[\"] {
    return ASPAS;
      }

(([a-zA-Z]+[0-9]*)([ ][a-zA-Z0-9]+)*) {
    return STRING;
    }

[0-9]+[.]?[0-9]* {
    return VALOR_NUMERICO;
    }

[[:space:]]+

. {yyerror("token desconhecido\n");}

%%
int yywrap() {
  return 1;
}
