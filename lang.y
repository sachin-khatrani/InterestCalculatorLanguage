%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<ctype.h>
	#include<math.h>
	int yylex(void);
	void yyerror(char *);		     
%}
%union{
    int ival;
    float fval;
}


%token <ival>INTEGER
%token <fval>FLOAT
%token PRAMOUNT
%token RATE
%token TIME
%type <fval>expr
%type <fval>rt
%type <fval>tm 
%type <fval>pr
%start program

%%
program:
	expr '\n'	{exit(1);}
	;
expr:	
	pr rt tm	{
			printf("---------------SIMPLE INTEREST---------------\n");
			$$=($1*$2*$3)/100;
			printf("The Interest Amount is %f\n",$$);
			printf("The Total Amount is %f\n",$$+$1);
			printf("---------------COMPOUND INTEREST---------------\n");
			double base=1+($2/1200);
			double exp=(12*$3);
			$$=pow(base,exp);
			$$=$1*$$;
			printf("The Total Amount is %f\n",$$);
			printf("The Interest Amount is %f\n\n",$$-$1);
			exit(0);}
			
	;
pr:
	PRAMOUNT '=' INTEGER     {$$=$3;}
        |PRAMOUNT '=' FLOAT      {$$=$3;}
	;
rt:
	RATE '=' INTEGER '%'	{$$=$3;}
	|RATE '=' FLOAT '%'	{$$=$3;}
	;
tm:
	TIME '=' INTEGER	{$$=$3;}
	|TIME '=' FLOAT		{$$=$3;}
	; 	
%%

void yyerror(char *s){
	fprintf(stderr,"%s\n",s); 
}
int main(void){
        
	yyparse();
	return 0;
}
