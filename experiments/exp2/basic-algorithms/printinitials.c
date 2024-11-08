#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
   if (argc < 2) return 1;
   char* str = argv[1];
   int i=0;
//   printf("Enter a string: ");
//   gets(str);
   
   printf("%c",str[0]);
   while(str[i]!='\0'){
       if(str[i]==' '){
            i++;
            printf("%c",str[i]);
       }
       i++;
   }
   printf("\n");
   return 0;
}
