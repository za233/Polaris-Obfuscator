#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
  if (argc < 2) return 1;
  int n,i=1,sum=0;

//  printf("Enter a number: ");
//  scanf("%d",&n);
  n = argv[1][0];

  while(i<n){
      if(n%i==0)
           sum=sum+i;
          i++;
  }
  if(sum==n)
      printf("%d is a perfect number\n",i);
  else
      printf("%d is not a perfect number\n",i);

  return 0;
}
