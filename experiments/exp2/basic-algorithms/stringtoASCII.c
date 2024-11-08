#include<stdio.h>
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    if (argc < 2) return 1;
    char* str = argv[1];//[50]="lheiombyymmdtjhzhydvhzcofopdwnhgizqzyvrvxjdnkbqoax";
    int i=0;

//    printf("Enter any string: ");
//    scanf("%s",str);

    printf("ASCII values of each characters of given string: ");
    while(str[i])
         printf("%d ",str[i++]);
        
    printf("\n");   
    return 0;
}
