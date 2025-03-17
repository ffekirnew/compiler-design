%{
#include <stdio.h>
%}

%option noyywrap
KEYWORD_JAVA  int|float|char|double|void|if|else|for|while|return|class|import|public|private|protected|static|final|try|catch|finally|throw|throws|extends|implements|interface|new|package|switch|case|default|break|continue|this|super|synchronized|volatile|transient|abstract|assert|enum|instanceof
IDENTIFIER    [a-zA-Z_][a-zA-Z0-9_]*
NUMBER        [0-9]+(\.[0-9]+)?
STRING        \"([^\\\"]|\\.)*\"
CHAR          \'([^\\\']|\\.)\'
COMMENT_JAVA  /\*([^*]|\*+[^*/])*\*+/
LINE_COMMENT  //[^\n]*

%%

{KEYWORD_JAVA}     { printf("Java Keyword: %s\n", yytext); }

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

