#include <stdio.h>

int main() {

	FILE *input = fopen("test.txt", "r");

	char buffer[1024];

	int len = fread(buffer, 1, sizeof(buffer), input);
	buffer[len] = '\0';

	printf("Contents: %s\n", buffer);
	return 0;
}
