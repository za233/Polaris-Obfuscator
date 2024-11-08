#include<stdio.h>
int fact(int);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
  if(argc < 2) return 1;
  int num,f;
//  printf("\nEnter a number: ");
//  scanf("%d",&num);
  num = (int) argv[1][0];//4;
  f=fact(num);
  printf("\nFactorial of %d is: %d\n",num,f);
  return 0;
}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int fact(int n){
	asm("backend-obfu"); 
   if(n==1)
       return 1;
   else
       return(n*fact(n-1));
 }
