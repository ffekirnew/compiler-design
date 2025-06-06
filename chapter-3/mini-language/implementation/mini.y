%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    extern int yylex();
    extern int yyerror(const char* s);
    extern FILE *yyin;
%}

%union {
    int ival;    // For integer values (e.g., NUMBER)
    char *sval;  // For string values (e.g., ID)
}

%token <sval> ID
%token <ival> NUMBER
%token IF THEN ELSE END REPEAT UNTIL READ WRITE
%token LT EQ PLUS MINUS TIMES OVER ASSIGN SEMICOLON LPAREN RPAREN

%left PLUS MINUS
%left TIMES OVER
%right ASSIGN
%nonassoc LT EQ

%%

// 1: program -> stmt_sequence
program : stmt_sequence
        { printf("Rule 1: program -> stmt_sequence\n"); }
        ;

// 2: stmt_sequence -> statement stmt_tail
stmt_sequence : statement stmt_tail
              { printf("Rule 2: stmt_sequence -> statement stmt_tail\n"); }
              ;

// 3: stmt_tail -> ; statement stmt_tail
stmt_tail : SEMICOLON statement stmt_tail
          { printf("Rule 3: stmt_tail -> ; statement stmt_tail\n"); }
          | /* epsilon */
          { printf("Rule 4: stmt_tail -> ε\n"); }
          ;

// 5: statement -> if_stmt
// 6: statement -> repeat_stmt
// 7: statement -> assign_stmt
// 8: statement -> read_stmt
// 9: statement -> write_stmt
statement : if_stmt
          { printf("Rule 5: statement -> if_stmt\n"); }
          | repeat_stmt
          { printf("Rule 6: statement -> repeat_stmt\n"); }
          | assign_stmt
          { printf("Rule 7: statement -> assign_stmt\n"); }
          | read_stmt
          { printf("Rule 8: statement -> read_stmt\n"); }
          | write_stmt
          { printf("Rule 9: statement -> write_stmt\n"); }
          ;

// 10: if_stmt -> if bool_exp then stmt_sequence else_part end
if_stmt : IF bool_exp THEN stmt_sequence else_part END
        { printf("Rule 10: if_stmt -> if bool_exp then stmt_sequence else_part end\n"); }
        ;

// 11: else_part -> else stmt_sequence
// 12: else_part -> ε
else_part : ELSE stmt_sequence
          { printf("Rule 11: else_part -> else stmt_sequence\n"); }
          | /* epsilon */
          { printf("Rule 12: else_part -> ε\n"); }
          ;

// 13: repeat_stmt -> repeat stmt_sequence until bool_exp
repeat_stmt : REPEAT stmt_sequence UNTIL bool_exp
            { printf("Rule 13: repeat_stmt -> repeat stmt_sequence until bool_exp\n"); }
            ;

// 14: assign_stmt -> ID := expression
assign_stmt : ID ASSIGN expression
            { printf("Rule 14: assign_stmt -> ID := expression\n"); }
            ;

// 15: read_stmt -> read ID
read_stmt : READ ID
          { printf("Rule 15: read_stmt -> read ID\n"); }
          ;

// 16: write_stmt -> write expression
write_stmt : WRITE expression
           { printf("Rule 16: write_stmt -> write expression\n"); }
           ;

// 17: bool_exp -> expression comp_op expression
bool_exp : expression comp_op expression
         { printf("Rule 17: bool_exp -> expression comp_op expression\n"); }
         ;

// 18: comp_op -> <
// 19: comp_op -> =
comp_op : LT
        { printf("Rule 18: comp_op -> <\n"); }
        | EQ
        { printf("Rule 19: comp_op -> =\n"); }
        ;

// 20: expression -> expression add_op term
// 21: expression -> term
expression : expression add_op term
           { printf("Rule 20: expression -> expression add_op term\n"); }
           | term
           { printf("Rule 21: expression -> term\n"); }
           ;

// 22: term -> term mul_op factor
// 23: term -> factor
term : term mul_op factor
     { printf("Rule 22: term -> term mul_op factor\n"); }
     | factor
     { printf("Rule 23: term -> factor\n"); }
     ;

// 24: factor -> ( expression )
// 25: factor -> NUMBER
// 26: factor -> ID
factor : LPAREN expression RPAREN
       { printf("Rule 24: factor -> ( expression )\n"); }
       | NUMBER
       { printf("Rule 25: factor -> NUMBER\n"); }
       | ID
       { printf("Rule 26: factor -> ID\n"); }
       ;

// 27: add_op -> +
// 28: add_op -> -
add_op : PLUS
       { printf("Rule 27: add_op -> +\n"); }
       | MINUS
       { printf("Rule 28: add_op -> -\n"); }
       ;

// 29: mul_op -> *
// 30: mul_op -> /
mul_op : TIMES
       { printf("Rule 29: mul_op -> *\n"); }
       | OVER
       { printf("Rule 30: mul_op -> /\n"); }
       ;

%%

int yyerror(const char* s) {
    fprintf(stderr, "Parsing error: %s\n", s);
    return 0;
}

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    } else {
        yyin = stdin;
    }

    printf("Starting parsing...\n");
    yyparse();
    printf("Parsing finished.\n");

    if (yyin != stdin) {
        fclose(yyin);
    }
    return 0;
}
