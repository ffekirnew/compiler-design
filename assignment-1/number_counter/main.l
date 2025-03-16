%{
int count_positive_numbers = 0;
int count_negative_numbers = 0;
int count_positive_fractions = 0;
int count_negative_fractions = 0;
%}
%%

[0-9]+ { count_positive_numbers++; printf("%s: positive number\n", yytext); }
-[0-9]+ { count_negative_numbers++; printf("%s: negative number\n", yytext); }
[0-9]+\.[0-9]+ { count_positive_fractions++; printf("%s: positive fraction\n", yytext); }
-[0-9]+\.[0-9]+ { count_negative_fractions++; printf("%s: negative fraction\n", yytext); }
.|\n { /* ignore everything else */ }
%%

int main()
{
      yylex();
      printf("Total positive numbers: %d\n", count_positive_numbers);
      printf("Total negative numbers: %d\n", count_negative_numbers);
      printf("Total positive fractions: %d\n", count_positive_fractions);
      printf("Total negative fractions: %d\n", count_negative_fractions);
}

