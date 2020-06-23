

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{' '}' ':' ',' ASPAS STRING '['']' VALOR_NUMERICO

%%
JSON_VALIDO: {printf("encontrei um JSON VALIDO\n");}
  JSON JSON_VALIDO
  |;

JSON:
  '{' CONTEUDO '}' {printf("encontrei um JSON\n");}
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
  |ELEMENTO
  |ELEMENTO ',' ELEMENTO
  |;

ELEMENTO:
  VALOR;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
