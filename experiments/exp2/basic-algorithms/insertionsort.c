#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
  if (argc < 11) return 1;
  int i,j,s=10,temp,a[10];//={79,2,38,62,15,73,100,31,39,7};

//  printf("Enter total elements: ");
//  scanf("%d",&s);

//  printf("Enter %d elements: ",s);
//  for(i=0;i<s;i++)
//      scanf("%d",&a[i]);
  for(i=1;i<argc;i++)
     a[i-1] = argv[i][0];

  for(i=1;i<s;i++){
      temp=a[i];
      j=i-1;
      while((temp<a[j])&&(j>=0)){
      a[j+1]=a[j];
          j=j-1;
      }
      a[j+1]=temp;
  }

  printf("After sorting: ");
  for(i=0;i<s;i++)
      printf(" %d",a[i]);

  return 0;
}
