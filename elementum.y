%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "element.h"
%}

%union {
int val;
char *buf;
}

%token <val> VAL
%token <buf> VAR
%token CREATE MIX REACT TRANSFORM STRENGTHEN WEAKEN BALANCE STATE IF WHILE END
%token ATK HP
%token '(' ')' '>' '<' '='
%type <buf> str
%type <buf> oper
%type <buf> comparison_op
%%

prog: str { printf("#include \"element.h\"\nmain() { %s }", $1); }
;

str: oper {
$$ = strdup($1);
}
| oper str {
asprintf(&$$, "%s\n%s", $1, $2);
}
;

oper:
CREATE VAR VAR VAL VAL {
asprintf(&$$, "Element %s = {%d, %d, \"%s\"};", $2, $4, $5, $3);
}
| MIX VAR VAR VAR {
asprintf(&$$, "Element %s = {%s.attack / 2 + %s.attack / 2, %s.health + %s.health, \"MIXED\"};", $4, $2, $3, $2, $3);
}
| REACT VAR VAR {
asprintf($$, "// Реакция между %s и %s\nif (strcmp(%s_type, \"FIRE\") == 0 && strcmp(%s_type, \"WATER\") == 0) {\n  printf(\"Создан STEAM\\n\");\n} else if (strcmp(%s_type, \"EARTH\") == 0 && strcmp(%s_type, \"AIR\") == 0) {\n  printf(\"Создан DUST\\n\");\n} else if (strcmp(%s_type, \"FIRE\") == 0 && strcmp(%s_type, \"EARTH\") == 0) {\n  printf(\"Создан LAVA\\n\");\n} else if (strcmp(%s_type, \"WATER\") == 0 && strcmp(%s_type, \"EARTH\") == 0) {\n  printf(\"Создан MUD\\n\");\n} else if (strcmp(%s_type, \"AIR\") == 0 && strcmp(%s_type, \"WATER\") == 0) {\n  printf(\"Создан STEAM\\n\");\n} else {\n  printf(\"Нет реакции\\n\");}", $2, $3, $2, $3, $2, $3, $2, $3, $2, $3, $2, $3);
}
| TRANSFORM VAR VAR {
asprintf(&$$, "strcpy(%s.type, \"%s\");", $2, $3);
}
| STRENGTHEN VAR VAL {
asprintf(&$$, "strengthen_element(&%s, %d);", $2, $3);
}
| WEAKEN VAR VAL {
asprintf(&$$, "weaken_element(&%s, %d);", $2, $3);
}
| BALANCE VAR VAL {
asprintf(&$$, "balance_element(&%s, %d);", $2, $3);
}
| STATE VAR {
asprintf(&$$, "printf(\"%s: ATK=%%d, HP=%%d, TYPE=%%s\\n\", %s.attack, %s.health, %s.type);", $2, $2, $2, $2);
}
| IF '(' comparison_op ')' str END {
asprintf(&$$, "if (%s) {\n%s\n}", $3, $5);
}
| WHILE '(' comparison_op ')' str END {
asprintf(&$$, "while (%s) {\n%s\n}", $3, $5);
}
;

comparison_op:
HP VAR '>' HP VAR {
asprintf(&$$, "%s.health > %s.health", $2, $5);
}
| HP VAR '<' HP VAR {
asprintf(&$$, "%s.health < %s.health", $2, $5);
}
| ATK VAR '>' ATK VAR {
asprintf(&$$, "%s.attack > %s.attack", $2, $5);
}
| ATK VAR '<' ATK VAR {
asprintf(&$$, "%s.attack < %s.attack", $2, $5);
}
;

%%

int yyerror(const char *s) {
fprintf(stderr, "Error: %s\n", s);
return 1;
}

int main() {
yyparse();
return 0;
}
