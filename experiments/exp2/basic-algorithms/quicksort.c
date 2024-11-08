#include<stdio.h>

void quicksort(int [10],int,int);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
  if (argc < 11) return 1;
  int x[10],i;

//  printf("Enter size of the array: ");
//  scanf("%d",&size);

//  printf("Enter %d elements: ",size);
//  for(i=0;i<size;i++)
//    scanf("%d",&x[i]);
  for (i=1;i<argc;i++)
     x[i-1] = argv[i][0];

  quicksort(x,0,argc-2);

  printf("Sorted elements: ");
  for(i=0;i<argc-2;i++)
    printf(" %d",x[i]);

  return 0;
}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
void quicksort(int x[10],int first,int last){
    int pivot,j,temp,i;

     if(first<last){
         pivot=first;
         i=first;
         j=last;

         while(i<j){
             while(x[i]<=x[pivot]&&i<last)
                 i++;
             while(x[j]>x[pivot])
                 j--;
             if(i<j){
                 temp=x[i];
                  x[i]=x[j];
                  x[j]=temp;
             }
         }

         temp=x[pivot];
         x[pivot]=x[j];
         x[j]=temp;
         quicksort(x,first,j-1);
         quicksort(x,j+1,last);

    }
}
