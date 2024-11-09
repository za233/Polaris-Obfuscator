#include<string>
#include<cstdio>
#include<cstring>
#define BACKEND_OBFU

__attribute((__annotate__(("flatten,boguscfg,substitution"))))
void encoder(char *data, char *enc) {
#ifdef BACKEND_OBFU 
	asm("backend-obfu");
#endif
	int len = strlen(data);
	for(int i = 0; i < len; i++) {
		if(data[i] >= 'a' && data[i] <= 'z') {
			enc[i] = (3 * (data[i] - 'a') + 11) % 26 + 'a';
		}
		else if(data[i] >= 'A' && data[i] <= 'Z') {
			enc[i] = (3 * (data[i] - 'A') + 11) % 26 + 'A';
		}
		else {
			enc[i] = '\0';
		}
	}
}
int main() {
	char data[100], result[100];
	scanf("%s", &data);
	encoder(data, result);
	printf("%s\n", result);
	return 0;
} 
