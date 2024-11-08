#include <stdio.h>
#include <stdlib.h>  /* For exit() function */
#include <time.h>

char *rand_string(char*, size_t);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
   if (argc < 2) return 1;
   char* c=argv[1];//[25]="glrpvpkxdvhisgkmudwyknbai";
   FILE *rfile, *wfile;
   wfile=fopen("program.txt","w");
   if(wfile==NULL){
      printf("Error!");
      exit(1);
   }
//   printf("Enter a sentence:\n");
//   gets(c);
   time_t t;
   srand((unsigned) time(&t));
//   rand_string(c, 25);
   fprintf(wfile,"%s",c);
   fclose(wfile);
   // Now read the content again. Yes, I know. :)
   rfile = fopen("program.txt","r");
   if(rfile==NULL){
       printf("Error!");
       exit(1);
   }
   char ch;
   while((ch = fgetc(rfile))!=EOF){
      printf("%c", ch);
   }
   printf("\n");
   fclose(rfile);
   return 0;
}
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
char *rand_string(char *str, size_t size)
{
	asm("backend-obfu"); 
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

