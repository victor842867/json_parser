
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%
[{] {
    printf("Encontrei { \n");
    return '{';\
    }

[}] {
    printf("Encontrei } \n");
    return '}';
    }

[[] {
    printf("Encontrei [ \n");
    return '[';
    }

[]] {
    printf("Encontrei ] \n");
    return ']';
    }

[\:] {
    printf("Encontrei : \n");
    return ':';
    }

[\,] {
    printf("Encontrei , \n");
    return ',';
    }

[\"] {
    printf("Encontrei ASPAS \n");
    return ASPAS;
      }

([a-zA-Z]+([ ][a-zA-Z0-9]+)*) {
    printf("Encontrei VARIAVEL = %s\n", yytext);
    return STRING;
    }
[0-9]+[.]?[0-9]* {
    printf("Encontrei NUMERO = %s\n", yytext);
    return VALOR_NUMERICO;
    }

[[:space:]]+

. {yyerror("token desconhecido\n");}

%%
int yywrap() {
  return 1;
}
