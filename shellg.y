%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<unistd.h>
	#include<string.h>
	extern int yylex();
	void yyerror();
	int append =0;
	void insertArg();
	void insertComm();
	char *arg_list[20];
	int i,count=1;
	int len;
	char command[20];
%}
%union{
	float f;
	char  *id;
}
%start C
%token <id> WORD
%token  NOTOKEN
%type <id> C A

%%
A:A WORD	{$$=$2;insertArg($2,len);count++;}
 |
 ;
C:WORD {$$=$1;insertComm($1,len);/*printf("%s\n",$$);*/} A	
 ;

%%

void insertComm(char *c,int len)
{	
		
	for(i=0;i<len;i++)
	{	
		command[i]=c[i];

	}
	arg_list[0]=&command[0];
}
void insertArg(char *arg,int len)
{
	arg_list[count]=strdup(arg);
	
}
void yyerror(char *msg){
	fprintf(stderr,"%s\n",msg);
	exit(1);
}

int main()
{	
	int status;
	while(1){
	yyparse();
	//arg_list[count]='\0';
	printf("arg_list[0]= %s\n",arg_list[0]);
	for(i=0;arg_list[i]!='\0';i++)
	{
		printf("arg_list[%d]= [%s]\n",i,arg_list[i]);
	}
	//printf("%s",sizeof(arg_list[1]));
	execvp(arg_list[0],arg_list);
	}
}
