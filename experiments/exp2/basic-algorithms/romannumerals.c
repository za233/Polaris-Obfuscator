#include<stdio.h>

void predigits(char c1,char c2);
void postdigits(char c,int n);

char roman_Number[1000];
int i=0;
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    if(argc < 2) return 1;
    int j;
    long int number;
   
//    printf("Enter any natural number: ");
//    scanf("%d",&number);
    number = argv[1][0];
   
    if(number <= 0){
         printf("Invalid number");
         return 0;
    }

    while(number != 0){

         if(number >= 1000){
             postdigits('M',number/1000);
             number = number - (number/1000) * 1000;
         }
         else if(number >=500){
             if(number < (500 + 4 * 100)){
                 postdigits('D',number/500);
                 number = number - (number/500) * 500;
             }
             else{
                 predigits('C','M');
                 number = number - (1000-100);
             }
         }
         else if(number >=100){
             if(number < (100 + 3 * 100)){
                 postdigits('C',number/100);
                 number = number - (number/100) * 100;
             }
             else{
                 predigits('L','D');
                 number = number - (500-100);
             }
         }
         else if(number >=50){
             if(number < (50 + 4 * 10)){
                 postdigits('L',number/50);
                 number = number - (number/50) * 50;
             }
             else{
                 predigits('X','C');
                 number = number - (100-10);
             }
         }
         else if(number >=10){
             if(number < (10 + 3 * 10)){
                 postdigits('X',number/10);
                 number = number - (number/10) * 10;
             }
             else{
                 predigits('X','L');
                 number = number - (50-10);
             }
         }
         else if(number >=5){
             if(number < (5 + 4 * 1)){
                 postdigits('V',number/5);
                 number = number - (number/5) * 5;
             }
             else{
                 predigits('I','X');
                 number = number - (10-1);
             }
         }
         else if(number >=1){
             if(number < 4){
                 postdigits('I',number/1);
                 number = number - (number/1) * 1;
             }
             else{
                 predigits('I','V');
                 number = number - (5-1);
             }
         }
    }

    printf("Roman number will be: ");
    for(j=0;j<i;j++)
         printf("%c",roman_Number[j]);
    printf("\n");
    return 0;

}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
void predigits(char c1,char c2){
    roman_Number[i++] = c1;
    roman_Number[i++] = c2;
}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
void postdigits(char c,int n){
    int j;
    for(j=0;j<n;j++)
         roman_Number[i++] = c;
   
}
