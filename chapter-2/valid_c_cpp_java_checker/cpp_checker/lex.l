%{
#include <stdio.h>
%}

%option noyywrap
KEYWORD_CPP   int|float|char|double|void|if|else|for|while|return|struct|#include|class|public|private|protected|namespace|using|new|delete|try|catch|throw|template|typename|const|constexpr|nullptr|this|operator|friend|virtual|override|final|static_cast|dynamic_cast|reinterpret_cast|const_cast
IDENTIFIER    [a-zA-Z_][a-zA-Z0-9_]*
NUMBER        [0-9]+(\.[0-9]+)?
STRING        \"([^\\\"]|\\.)*\"
CHAR          \'([^\\\']|\\.)\'
COMMENT_C     /\*([^*]|\*+[^*/])*\*+/
LINE_COMMENT  //[^\n]*

%%

{KEYWORD_CPP}      { printf("C++ Keyword: %s\n", yytext); }

{IDENTIFIER}       { printf("Identifier: %s\n", yytext); }
{NUMBER}           { printf("Number: %s\n", yytext); }
{STRING}           { printf("String Literal: %s\n", yytext); }
{CHAR}             { printf("Char Literal: %s\n", yytext); }

[{}();,]           { printf("Symbol: %s\n", yytext); }
[=+\-*/%<>!&|^~]   { printf("Operator: %s\n", yytext); }

[ \t\n\r]+         { /* Ignore whitespace */ }

.                  { printf("Unknown: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

