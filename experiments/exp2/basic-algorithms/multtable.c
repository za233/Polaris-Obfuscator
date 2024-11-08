/* C program to find multiplication table up to 10. */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
    if (argc < 2) return 1;
    int n, i;
//    printf("Enter an integer to find multiplication table: ");
//    scanf("%d",&n);
    time_t t;
    srand((unsigned) time(&t)); // seed rand()
    n = argv[1][0];//4;//rand() % 50;

    for(i=1;i<=10;++i)
    {
        printf("%d * %d = %d\n", n, i, n*i);
    }
    return 0;
}
