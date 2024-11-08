#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
int check_anagram(char [], char []);
char *rand_string(char *, size_t);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[])
{
	asm("backend-obfu"); 
   // Check the number of passed arguments
   if(argc < 3) return 1; 
   //int length = 25;
   char* a = argv[1];// = "tqzrwpalcjviqqpdqvzfbttoy";
   char* b = argv[2];//"dt12btmwtlberxblrvotkeotvxg";
   int flag;
   time_t t;
 
    srand((unsigned) time(&t)); // seed rand()
//   printf("Enter first string\n");
//   gets(a);
//    rand_string(a, length);
 
//   printf("Enter second string\n");
//   gets(b);
//   rand_string(b, length); 
   
   flag = check_anagram(a, b);
 
   if (flag == 1)
      printf("\"%s\" and \"%s\" are anagrams.\n", a, b);
   else
      printf("\"%s\" and \"%s\" are not anagrams.\n", a, b);
 
   return 0;
}
 __attribute((__annotate__(("flatten,boguscfg,substitution"))))
int check_anagram(char a[], char b[])
{
	asm("backend-obfu"); 
   int first[26] = {0}, second[26] = {0}, c = 0;
 
   while (a[c] != '\0')
   {
      first[a[c]-'a']++;
      c++;
   }
 
   c = 0;
 
   while (b[c] != '\0')
   {
      second[b[c]-'a']++;
      c++;
   }
 
   for (c = 0; c < 26; c++)
   {
      if (first[c] != second[c])
         return 0;
   }
 
   return 1;
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
