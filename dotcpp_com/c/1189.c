#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * C++中int型整数内码是一个32位的01序列，该01序列有些是对称的，有些是不对称的。
 * 对于给定的一个整数，在一些场合，需要判断其整数内码的对称性。
 * 这个事情要做好还非你不行呢
 */

int myfun(unsigned long int a)
{
	int i = 0;
	int flag = -1;
	unsigned long int X = 0;
	X = 0x10000000000000000000000000000000;
	printf("X=%ld\n", X);
	
	for (i = 32; i >0; --i) {
		if ( a&X == X) {
			flag = i;
			break;
		}
		X = X>1;
		printf("X=%ld\n", X);
	}

	printf("flag=%d\n", flag);
	return 0;
}
void test1189()
{
	unsigned long int n;
	unsigned long int cnt = 0;
	while(~scanf("%ld", &n)){
		if (n<0) {
			break;
		}

		if (!myfun(n)) {
			cnt++;
		}
	}
	printf("%ld\n", cnt);
		
}

int
main(args, argv)
int args;
char **argv;
{
	test1189();
	return 0;
}
