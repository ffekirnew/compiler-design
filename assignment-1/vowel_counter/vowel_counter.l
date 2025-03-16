%{
int count_vowels(char *word);
int total_vowels = 0;
%}
%%

[a-zA-Z]* { printf("%s: %d vowels\n", yytext, count_vowels(yytext)); }
.|\n { /* ignore everything else */ }
%%

int main()
{
      yylex();
      printf("Total vowels in c file: %d\n", total_vowels);
}

int count_vowels(char *word) {
  int count = 0;

  for (int i = 0; word[i] != '\0'; i++) {
    if (word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' || word[i] == 'u') {
      count++;
    }
  }

  total_vowels += count;
  return count;
}
