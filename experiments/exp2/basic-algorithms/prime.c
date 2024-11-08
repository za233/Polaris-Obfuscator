/* C program to check whether a number is prime or not. */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
  //if (argc<2) return 1;
  int n, i, flag=0;
  printf("Enter a positive integer: ");
  scanf("%d",&n);
  time_t t;
  srand((unsigned) time(&t)); // seed rand()
  //n = argv[1][0];//rand() % 50;

  for(i=2;i<=n/2;++i)
  {
      if(n%i==0)
      {
          flag=1;
          break;
      }
  }
  if (flag==0)
      printf("%d is a prime number.\n",n);
  else
      printf("%d is not a prime number.\n",n);
  return 0;
}
