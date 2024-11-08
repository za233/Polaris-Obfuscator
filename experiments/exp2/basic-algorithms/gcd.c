/* C Program to Find Highest Common Factor. */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
    //if (argc < 3) return 1;
    int num1, num2, i, hcf;
    printf("Enter two integers: ");
    scanf("%d %d", &num1, &num2);
   time_t t;
   srand((unsigned) time(&t)); // seed rand()
   //num1 = argv[1][0];//50;//rand() % 50;
   //num2 = argv[2][0];//44;//rand() % 50;

    for(i=1; i<=num1 || i<=num2; ++i)
    {
        if(num1%i==0 && num2%i==0)   /* Checking whether i is a factor of both number */
            hcf=i;
    }
    printf("H.C.F of %d and %d is %d\n", num1, num2, hcf);
    return 0;
}
