/* This program counts the number of a's in the input file
   Usage: <EXE FILE> <INPUT_FILE>
*/

#include <stdio.h>

int main(int argc, char *argv[])
{
	FILE *fptr;
	char c;
	int num_a = 0;

	if (argc < 2)
	{
		printf("Error!\n");
		printf("Correct format: ./a.out <sample file>\n");
		return -1;
	}

	fptr = fopen(argv[1], "r");

	while (!feof(fptr))
	{
		fscanf(fptr, "%c", &c);
		if(c == 'a')
			num_a++;
	}
	printf("Number of a's is: %d\n", num_a);

	return 0;
}
