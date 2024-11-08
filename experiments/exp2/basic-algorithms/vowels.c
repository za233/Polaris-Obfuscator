#include<stdio.h>
#include <stdlib.h>
#include <time.h>

char *rand_string(char*, size_t);
__attribute((__annotate__(("flatten,boguscfg,substitution"))))
int main(int argc, char* argv[]){
	asm("backend-obfu"); 
    if (argc<2) return 1;
    char* line=argv[1];//[50]="grsxvbqwwirgygiikmmixflwibcasyewaqaqbxpkhycsrmwcfm";
    int i,v,c,ch,d,s,o;
    time_t t;
    o=v=c=ch=d=s=0;
//    printf("Enter a line of string:\n");
//    gets(line);
    srand((unsigned) time(&t));
    //rand_string(line, 50);
    for(i=0;line[i]!='\0';++i)
    {
        if(line[i]=='a' || line[i]=='e' || line[i]=='i' || line[i]=='o' || line[i]=='u' || line[i]=='A' || line[i]=='E' || line[i]=='I' || line[i]=='O' || line[i]=='U')
            ++v;
        else if((line[i]>='a'&& line[i]<='z') || (line[i]>='A'&& line[i]<='Z'))
            ++c;
        else if(line[i]>='0'&&c<='9')
            ++d;
        else if (line[i]==' ')
            ++s;
    }
    printf("Vowels: %d",v);
    printf("\nConsonants: %d",c);
    printf("\nDigits: %d",d);
    printf("\nWhite spaces: %d",s);
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

