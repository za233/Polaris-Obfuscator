#include<stdio.h>

void stringConcat(char[],char[]);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    int compare;
	char str1[100];
    char str2[100];
    printf("Enter first string: ");
    scanf("%s",str1);

    printf("Enter second string: ");
    scanf("%s",str2);

    
    stringConcat(str1,str2);

    printf("String after concatenation: %s\n",str1);

    return 0;
}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
void stringConcat(char str1[],char str2[]){
    int i=0,j=0;
   
   
    while(str1[i]!='\0'){
         i++;
    }

    while(str2[j]!='\0'){
         str1[i] = str2[j];   
         i++;
         j++;
    }

    str1[i] = '\0';
}
