/* C program to find LCM of two positive integers entered by user */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
  if (argc < 3 ) return 1;
  int num1, num2, max;
//  printf("Enter two positive integers: ");
//  scanf("%d %d", &num1, &num2);
  time_t t;
  srand((unsigned) time(&t)); // seed rand()
  num1 = argv[1][0];//45;//rand() % 50;
  num2 = argv[2][0];//9;//rand() % 50;

  max=(num1>num2) ? num1 : num2; /* maximum value is stored in variable max */
  while(1)                       /* Always true. */
  {
      if(max%num1==0 && max%num2==0)
      {
          printf("LCM of %d and %d is %d\n", num1, num2,max);
          break;          /* while loop terminates. */
      }
      ++max;
  }
  return 0;
}
