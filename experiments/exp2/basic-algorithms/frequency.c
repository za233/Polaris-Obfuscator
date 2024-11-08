#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char *rand_string(char*,size_t);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
   if (argc < 3) return 1;
   int i,count=0;
//   printf("Enter a string: ");
//   gets(c);
   time_t t;
   srand((unsigned) time(&t));
   //rand_string(c, 50);

//   printf("Enter a character to find frequency: ");
//   scanf("%c",&ch);

   char* c = argv[1];
   char ch = argv[2][0];

   for(i=0;c[i]!='\0';++i)
   {
       if(ch==c[i])
           ++count;
   }
   printf("Frequency of %c = %d", ch, count);
   return 0;
}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
char *rand_string(char *str, size_t size)
{
    const char charset[] = "abcdefghijklmnopqrstuvwxyz1234567890";
    if (size) {
        --size;
        for (size_t n = 0; n < size; n++) {
            int key = rand() % (int) (sizeof charset - 1);
            str[n] = charset[key];
        }
        str[size] = '\0';
    }
    return str;
}

