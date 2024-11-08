#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 __attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
  //if (argc < 2) return 1;
  int n, i,  c, a = 1;
 
  printf("Enter the number of rows of Floyd's triangle to print\n");
  scanf("%d", &n);
  time_t t;
  //srand((unsigned) time(&t)); // seed rand()
  //n = (int) argv[1][0];//rand() % 50;
 
  for (i = 1; i <= n; i++)
  {
    for (c = 1; c <= i; c++)
    {
      printf("%d ",a);
      a++;
    }
    printf("\n");
  }
 
  return 0;
}
