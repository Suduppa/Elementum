%{
#include "file_b.h"
//#include "element.h"
%}

letter [a-zA-Z]
digit [0-9]

%%

"CREATE" { return CREATE; }
"MIX" { return MIX; }
"REACT" { return REACT; }
"TRANSFORM" { return TRANSFORM; }
"STRENGTHEN" { return STRENGTHEN; }
"WEAKEN" { return WEAKEN; }
"BALANCE" { return BALANCE; }
"STATE" { return STATE; }
"IF" { return IF; }
"WHILE" { return WHILE; }
"END" { return END; }
"HP" { return HP; }
"ATK" { return ATK; }

"(" { return '('; }
")" { return ')'; }
">" { return '>'; }
"<" { return '<'; }
"=" { return '='; }

{letter}+ { yylval.buf = strdup(yytext); return VAR; }
{digit}+ { yylval.val = atoi(yytext); return VAL; }

[ \n\t]+ {}

. {}
%%
int yywrap() {
    return 1;
}
