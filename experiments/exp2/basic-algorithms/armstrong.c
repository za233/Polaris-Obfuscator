#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
  if(argc < 2) return 1;
  int n, n1, rem, num=0;
//  printf("Enter a positive  integer: ");
//  scanf("%d", &n);
  //time_t t;
  //srand((unsigned) time(&t)); // seed rand()
  //n = 33;//rand();
  n = (int) argv[1][0];
  n1=n;
  while(n1!=0)
  {
      rem=n1%10;
      num+=rem*rem*rem;
      n1/=10;
  }
  if(num==n)
    printf("is an Armstrong number.");
  else
    printf("is not an Armstrong number.");
}
