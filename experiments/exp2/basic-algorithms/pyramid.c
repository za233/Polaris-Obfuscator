#include <stdio.h>
#include <stdlib.h>
#include <time.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
    if(argc < 2) return 1;
    int i,j,rows;
//    printf("Enter the number of rows: ");
//    scanf("%d",&rows);
    time_t t;
    srand((unsigned) time(&t)); // seed rand()
    rows = argv[1][0];//6;//rand() % 10;

    for(i=1;i<=rows;++i)
    {
        for(j=1;j<=i;++j)
        {
           printf("* ");
        }
        printf("\n");
    }
    return 0;
}
