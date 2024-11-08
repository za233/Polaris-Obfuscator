#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    if (argc < 2) return 1;
    int number,i=0,j,digit;
    char * word[1000];

//    printf("Enter any integer: ");
//    scanf("%d",&number);
    number = argv[1][0];

    while(number){

    digit = number %10;
    number = number /10;

         switch(digit){
             case 0: word[i++] = "zero"; break;
             case 1: word[i++] = "one"; break;
             case 2: word[i++] = "two"; break;
             case 3: word[i++] = "three"; break;
             case 4: word[i++] = "four"; break;
             case 5: word[i++] = "five"; break;
             case 6: word[i++] = "six"; break;
             case 7: word[i++] = "seven"; break;
             case 8: word[i++] = "eight"; break;
             case 9: word[i++] = "nine"; break;

         }
    }
   
    for(j=i-1;j>=0;j--){
         printf("%s ",word[j]);
    }
    printf("\n");
    return 0;

}
