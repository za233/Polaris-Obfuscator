#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    if (argc < 12) return 1;
    int a[10],i,m,c=0,l,u,mid;

    for(i=1;i<argc-1;i++){
        a[i-1] = argv[i][0];
    }
//    printf("Enter the size of an array: ");
//    scanf("%d",&n);

//    printf("Enter the elements in ascending order: ");
//    for(i=0;i<n;i++){
//         scanf("%d",&a[i]);
//    }

//    printf("Enter the number to be search: ");
//    scanf("%d",&m);
    m = (int) argv[argc-1][0];//64;

    l=0,u=argc-2;
    while(l<=u){
         mid=(l+u)/2;
         if(m==a[mid]){
             c=1;
             break;
         }
         else if(m<a[mid]){
             u=mid-1;
         }
         else
             l=mid+1;
    }
    if(c==0)
         printf("The number is not found.\n");
    else
         printf("The number is found.\n");

    return 0;
}

