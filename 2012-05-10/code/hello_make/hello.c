#include <stdio.h>
#include "hello.h"
#include "welcome.h"

int main()
{
	printf(" compile and link demo %s\n", HELLO_VER );
	welcome();

	return 0;
}

