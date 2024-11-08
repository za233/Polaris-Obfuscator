/* C program to display factorial of an integer if user enters non-negative integer. */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
    if (argc < 2) return 1;
    int n, count;
    unsigned long long int factorial=1;         
//    printf("Enter an integer: ");
//    scanf("%d",&n);
    time_t t;
    srand((unsigned) time(&t)); // seed rand()
    n = (int) argv[1][0];
    if ( n< 0)
        printf("Error!!! Factorial of negative number doesn't exist.\n");
    else
    {
       for(count=1;count<=n;++count)    /* for loop terminates if count>n */
       {
          factorial*=count;              /* factorial=factorial*count */
       }
    printf("Factorial = %lu\n",factorial);
    }
    return 0;
}
