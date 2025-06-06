# Chapter 3: Mini Language Parser

## 

## Command used:
```sh
❯ lex mini.l
❯ byacc -d mini.y
❯ gcc -c lex.yy.c y.tab.c
❯ gcc -o mini_parser lex.yy.o y.tab.o -ll
❯ ./mini_parser source.mini
```

## Output:
```txt
Starting parsing...
Rule 15: read_stmt -> read ID
Rule 8: statement -> read_stmt
Rule 26: factor -> ID
Rule 23: term -> factor
Rule 21: expression -> term
Rule 18: comp_op -> <
Rule 25: factor -> NUMBER
Rule 23: term -> factor
Rule 21: expression -> term
Rule 17: bool_exp -> expression comp_op expression
Rule 25: factor -> NUMBER
Rule 23: term -> factor
Rule 21: expression -> term
Rule 14: assign_stmt -> ID := expression
Rule 7: statement -> assign_stmt
Rule 26: factor -> ID
Rule 23: term -> factor
Rule 29: mul_op -> *
Rule 26: factor -> ID
Rule 22: term -> term mul_op factor
Rule 21: expression -> term
Rule 14: assign_stmt -> ID := expression
Rule 7: statement -> assign_stmt
Rule 26: factor -> ID
Rule 23: term -> factor
Rule 21: expression -> term
Rule 28: add_op -> -
Rule 25: factor -> NUMBER
Rule 23: term -> factor
Rule 20: expression -> expression add_op term
Rule 14: assign_stmt -> ID := expression
Rule 7: statement -> assign_stmt
Parsing error: syntax error
Parsing finished.
```
