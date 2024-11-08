#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
  if(argc < 11) return 1;
  int a[10],i,big,small;

//  printf("\nEnter the size of the array: ");
//  scanf("%d",&size);
//  printf("\nEnter %d elements in to the array: ", size);
//  for(i=0;i<size;i++)
//      scanf("%d",&a[i]);

  for(i=1;i<argc;i++)
     a[i-1] = argv[i][0];

  big=a[0];
  for(i=1;i<argc-1;i++){
      if(big<a[i])
           big=a[i];
  }
  printf("Largest element: %d\n",big);
 
  small=a[0];
  for(i=1;i<argc-1;i++){
      if(small>a[i])
           small=a[i];
  }
  printf("Smallest element: %d\n",small);

  return 0;
}
