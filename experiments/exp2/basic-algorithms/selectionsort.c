#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
  if(argc < 11) return 1;
  int i,j,temp,a[10];

//  printf("Enter total elements: ");
//  scanf("%d",&s);

//  printf("Enter %d elements: ",s);
//  for(i=0;i<s;i++)
//      scanf("%d",&a[i]);

  for(i=1;i<argc;i++)
      a[i-1] = argv[i][0];

  for(i=0;i<argc-1;i++){
      for(j=i+1;j<argc-1;j++){
           if(a[i]>a[j]){
               temp=a[i];
              a[i]=a[j];
              a[j]=temp;
           }
      }
  }

  printf("After sorting is: ");
  for(i=0;i<argc-1;i++)
      printf(" %d",a[i]);

  printf("\n");
  return 0;
}
