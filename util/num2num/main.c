#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Usage: num2num [TYPE] [NUMBER]
int main(int argc, char *argv[]) {

	if (argc > 3) {
		printf("Usage: num2num [TYPE] [NUMBER]\n");
	}
	
	char *number_type = argv[1];
	int num = atoi(argv[2]);

	if (strcmp(number_type, "binary") == 0) {
		printf("%b\n", num);
	}
	if (strcmp(number_type, "hex") == 0) {
		printf("%x\n", num);
	}
	if (strcmp(number_type, "decimal") == 0) {
		printf("%d\n", num);
	}
	return 0;
}
