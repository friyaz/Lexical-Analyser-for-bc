/*Author - Faisal Riyaz*/

%{
#include<stdio.h>
%}

%%

scale|ibase|obase|last { printf("< Special Variable, %s >", yytext); }
print|read|define|return|auto { printf("< Keyword, %s >", yytext); } 
if|else|break|for|while|break|continue { printf("< Control Flow Keyword, %s >",yytext);}		

^"/*"[^*]*|[*]*"*/" { printf("< Comment, %s >",yytext);}	

[|0-9].[0-9]+ { printf("< Float, %s >", yytext); }
[0-9]+ { printf("< Integer, %s >", yytext);} 
\".*\" { printf("< String, %s >", yytext);} 

"+="|"-="|"<="|">="|"!="|"=="|"++"|"--" {printf("< Operator, %s >",yytext);}
[+-/*^<>=%] {printf("< Operator, %s >",yytext);}

[a-zA-Z][a-zA-Z0-9_]* { printf("< Id, %s >", yytext); }
[{}()] { printf("< Bracket, %s >", yytext);}
[,;] { printf("< Separator, %s >", yytext);}

%%

int yywrap() {};

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1],"r");
	yylex();
	return 0;
}
