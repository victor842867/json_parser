

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' ':' ',' ASPAS STRING '['']' VALOR_NUMERICO

%%
JASON_VALIDO:
  JSON {printf("VALIDO\n");
        return 0;
        }
  |JSON JASON_VALIDO {printf("VALIDO\n");
                      return 0;
                      }
  ;

JSON:
  '{' CONTEUDO '}'
  ;

CONTEUDO:
  VARIAVEL ':' VALOR
  |CONTEUDO ',' CONTEUDO
  |JSON;


VARIAVEL:
  ASPAS STRING ASPAS;

VALOR:
  VALOR_NUMERICO
  |VARIAVEL
  |'[' LISTA ']'
  |JSON;


LISTA:
  ELEMENTO
  |LISTA ',' ELEMENTO 
  |;

ELEMENTO:
  VALOR;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
  return;
}

int main() {
  yyparse();
    return 0;
}
