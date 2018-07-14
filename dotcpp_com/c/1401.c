#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void convto(char *s, int n, int b)
{
	char bit[]={"0123456789ABCDEF"};
	int len;
	if (n == 0)
	{
		strcpy(s, "");
		return;
	}
	convto(s, n/b, b);
	len=strlen(s);
	s[len]=bit[n%b];
	s[len+1]='\0';
}


void test1401()
{
	char s[150];
	int N;
	int R; /* 2<=R && R<=16 */
	
	R=-1;	
	while(~scanf("%d %d", &N, &R))
	{
		memset(s, 0x00, sizeof(s));
		if (R<2||R>16)
		{
			printf("%d<2||%d>16\n", R, R);
			continue;
		}
		convto(s, N, R);
		printf("%s\n", s);
	}

}
int main()
{
	test1401();
	return 0;
}
