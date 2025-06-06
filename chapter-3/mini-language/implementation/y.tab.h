#ifndef _yy_defines_h_
#define _yy_defines_h_

#define ID 257
#define NUMBER 258
#define IF 259
#define THEN 260
#define ELSE 261
#define END 262
#define REPEAT 263
#define UNTIL 264
#define READ 265
#define WRITE 266
#define LT 267
#define EQ 268
#define PLUS 269
#define MINUS 270
#define TIMES 271
#define OVER 272
#define ASSIGN 273
#define SEMICOLON 274
#define LPAREN 275
#define RPAREN 276
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    int ival;    /* For integer values (e.g., NUMBER)*/
    char *sval;  /* For string values (e.g., ID)*/
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
