

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '[' ']' NUMERO STRING ',' '"'

%%
LISTA_VALIDA:
  '[' LISTA ']' {printf("LISTA VALIDA\n");}
  ;

LISTA:
  ELEMENTO
  |ELEMENTO ',' LISTA;
  |;

ELEMENTO:
  NUMERO
  |'"' STRING '"'
  ;
%%

void yyerror(char *s) {
  printf("ERRO\n");
}

int main() {
  yyparse();
    return 0;

}
