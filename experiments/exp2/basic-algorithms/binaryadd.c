#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){

	asm("backend-obfu"); 
    if (argc < 3) return 1;
    long int binary1,binary2;
    int i=0,remainder = 0,sum[20];

//    printf("Enter any first binary number: ");
//    scanf("%ld",&binary1);
//    printf("Enter any second binary number: ");
//    scanf("%ld",&binary2);
   binary1 = (long int) argv[1][0];//1100010;
   binary2 = (long int) argv[2][0];//1001101;

    while(binary1!=0||binary2!=0){
         sum[i++] =  (binary1 %10 + binary2 %10 + remainder ) % 2;
         remainder = (binary1 %10 + binary2 %10 + remainder ) / 2;
         binary1 = binary1/10;
         binary2 = binary2/10;
    }

    if(remainder!=0)
         sum[i++] = remainder;

    --i;
    printf("Sum of two binary numbers: ");
    while(i>=0)
         printf("%d",sum[i--]);
         printf("\n");

   return 0;
}
