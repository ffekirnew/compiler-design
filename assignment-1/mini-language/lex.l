%{
#include <stdio.h>
%}

digit       [0-9]
letter      [a-zA-Z]
alphanum    [a-zA-Z0-9]

%%

"if"        { printf("Token: IF_TOKEN\n"); }
"then"      { printf("Token: THEN_TOKEN\n"); }
"else"      { printf("Token: ELSE_TOKEN\n"); }
"end"       { printf("Token: END_TOKEN\n"); }
"repeat"    { printf("Token: REPEAT_TOKEN\n"); }
"until"     { printf("Token: UNTIL_TOKEN\n"); }
"read"      { printf("Token: READ_TOKEN\n"); }
"write"     { printf("Token: WRITE_TOKEN\n"); }

{letter}{alphanum}* { printf("Token: ID (Value: %s)\n", yytext); }
{digit}+    { printf("Token: NUM (Value: %s)\n", yytext); }

":="        { printf("Token: ASSIGN\n"); }
"<"         { printf("Token: LT\n"); }
"="         { printf("Token: EQ\n"); }
"+"         { printf("Token: PLUS\n"); }
"-"         { printf("Token: MINUS\n"); }
"*"         { printf("Token: TIMES\n"); }
"/"         { printf("Token: DIVIDE\n"); }
"("         { printf("Token: LPAREN\n"); }
")"         { printf("Token: RPAREN\n"); }
";"         { printf("Token: SEMICOLON\n"); }

"{"[^}{]*"}" { printf("Ignored Comment: %s\n", yytext); }

[ \t\n]+    { }

.           {
              fprintf(stderr, "Error: Unrecognized character: %s\n", yytext);
            }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

