The MINI Language Introduction
Assumptions:
    - Source code – MINI language
    - Target code – Assembly language
Specifications:
    - There are no procedures and declarations.
    - All variables are integer variables, and variables are declared simply by assigning values to them.
    - There are only two control statements:
        - An if – statement and
        - A repeat statement
    - Both the control statements may themselves contain statement sequences.
    - An if – statement has an optional else part and must be terminated by the key word end.
    - There are also read and write statements that perform input/output.
    - Comments are allowed with curly brackets, comments cannot be nested.
    - Expression in MINI are also limited to Boolean and integer arithmetic expressions.
    - A Boolean expressions consists of a comparison of two arithmetic expressions using either of the two comparison operators < and =.
    - An arithmetic expression may involve integer constants, variables, parenthesis, and any of the four integer operators +, *, and / (integer division).
    - Boolean expressions may appear only as tests in control statements – i.e. There are no Boolean variables, assignment, or I/O.
    - Here is a sample program in this language for factorial function.

    ```mini
    { sample program
      in MINI language – computes factorials
    }

    read x; { input an integer }

    if x > 0 then { don’t compute if x <= 0}
      fact := 1;

      repeat
        fact := fact * x;
        x := x - 1;
      until x = 0;

      write fact { output factorial of x}

    end
    ```
In addition to the tokens, MINI has the following lexical conventions:
    - Comments : are enclosed in curly brackets {...} and cannot be nested.
    - White space : consists of blanks, tabs, and newlines.
    - The principles of long

In designing a scanner for this language:
1. Start with regular expressions
2. Identify Tokens...
3. Develop and simulate NFA
4. Construct and simulate DFA
5. Write a lex program, to recognize tokens in

MINI language:

• Input: MINI language
• Output: Tokens..,
