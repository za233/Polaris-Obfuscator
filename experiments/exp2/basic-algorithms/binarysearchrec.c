#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    if (argc < 12) return 1;
    int a[10],i,m,c,l,u;

//    printf("Enter the size of an array: ");
//    scanf("%d",&n);

//    printf("Enter the elements of the array: " );
//    for(i=0;i<n;i++){
//         scanf("%d",&a[i]);
//    }

//    printf("Enter the number to be search: ");
//    scanf("%d",&m);
    for (i=1;i<argc-1;i++)
        a[i-1] = argv[i][0];

    m = (int) argv[argc-1][0];//35;

    l=0,u=argc-2;
    c=binary(a,argc-1,m,l,u);
    if(c==0)
         printf("Number is not found.\n");
    else
         printf("Number is found.\n");

    return 0;
 }

int binary(int a[],int n,int m,int l,int u){

     int mid,c=0;

     if(l<=u){
          mid=(l+u)/2;
          if(m==a[mid]){
              c=1;
          }
          else if(m<a[mid]){
              return binary(a,n,m,l,mid-1);
          }
          else
              return binary(a,n,m,mid+1,u);
     }
     else
       return c;
}
