%{
#include<stdlib.h>
#include<math.h>
void yyerror(char *);
#include "y.tab.h"
%}

%% 
[1-9][0-9]*	{
	  
	   yylval.ival = atoi(yytext);
	   return INTEGER;
	        }
[0-9]+\.[0-9]+   {
	  
	   yylval.fval = atof(yytext);
	   return FLOAT;
		}
"Principal Amount"|"Amount"|"Principal" 		{return (PRAMOUNT);}
"Rate"|"Interest Rate"|"Rate of Interest"	        {return (RATE);}
"Time"|"Period"						{return (TIME);}
[=]							{return *yytext;}	
[%]							{return *yytext;}
[ \t\n\b] ;
.							{yyerror("invalid character")};
%%
int yywrap(void){
	return 1;
}
