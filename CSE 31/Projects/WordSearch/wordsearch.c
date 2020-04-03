#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// DO NOT INCLUDE OTHER LIBRARY!

// Declarations of the two functions you will implement
// Feel free to declare any helper functions
void printPuzzle(char **arr, int n);
void searchPuzzle(char **arr, int n, char **list, int listSize);

// Main function, DO NOT MODIFY!!!
int main(int argc, char **argv)
{
	int bSize = 15;
	if (argc != 2)
	{
		fprintf(stderr, "Usage: %s <puzzle file name>\n", argv[0]);
		return 2;
	}
	int i, j;
	FILE *fptr;
	char **block = (char **)malloc(bSize * sizeof(char *));
	char **wordss = (char **)malloc(50 * sizeof(char *));

	// Open file for reading puzzle
	fptr = fopen(argv[1], "r");
	if (fptr == NULL)
	{
		printf("Cannot Open Puzzle File!\n");
		return 0;
	}

	// Read puzzle block into 2D arrays
	for (i = 0; i < bSize; i++)
	{
		*(block + i) = (char *)malloc(bSize * sizeof(char));

		fscanf(fptr, "%c %c %c %c %c %c %c %c %c %c %c %c %c %c %c\n", *(block + i), *(block + i) + 1, *(block + i) + 2, *(block + i) + 3, *(block + i) + 4, *(block + i) + 5, *(block + i) + 6, *(block + i) + 7, *(block + i) + 8, *(block + i) + 9, *(block + i) + 10, *(block + i) + 11, *(block + i) + 12, *(block + i) + 13, *(block + i) + 14);
	}
	fclose(fptr);

	// Open file for reading words list
	fptr = fopen("states.txt", "r");
	if (fptr == NULL)
	{
		printf("Cannot Open wordss File!\n");
		return 0;
	}

	// Save wordss into arrays
	for (i = 0; i < 50; i++)
	{
		*(wordss + i) = (char *)malloc(20 * sizeof(char));
		fgets(*(wordss + i), 20, fptr);
	}

	// Remove newline characters from each words (except for the last words)
	for (i = 0; i < 49; i++)
	{
		*(*(wordss + i) + strlen(*(wordss + i)) - 2) = '\0';
	}

	// Print out words list
	printf("Printing list of wordss:\n");
	for (i = 0; i < 50; i++)
	{
		printf("%s\n", *(wordss + i));
	}
	printf("\n");

	// Print out original puzzle grid
	printf("Printing puzzle before search:\n");
	printPuzzle(block, bSize);
	printf("\n");

	// Call searchPuzzle to find all wordss in the puzzle
	searchPuzzle(block, bSize, wordss, 50);
	printf("\n");

	// Print out final puzzle grid with found wordss in lower case
	printf("Printing puzzle after search:\n");
	printPuzzle(block, bSize);
	printf("\n");

	return 0;
}

void printPuzzle(char **arr, int n)
{
	// This function will print out the complete puzzle grid (arr). It must produce the output in the SAME format as the samples in the instructions.
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n; j++)
		{
			printf("%c ", *(*(arr + i) + j));
		}
		printf("\n");
	}
}

void searchPuzzle(char **arr, int n, char **list, int listSize)
{
	char **foundList = (char **)malloc(n * sizeof(char *));

	for (int words = 0; words < listSize; words++)
	{
		for (int letter = 0; letter < strlen(*(list + words)); letter++)
		{
			char *word = (char *)malloc((n + 1) * sizeof(char));
			*(word + letter) = (*(*(list + words) + letter));
			printf("%s", word);

			char *tempStr = (char *)malloc((n + 1) * sizeof(char));

			for (int row = 0; row < n; row++)
			{
				*(foundList + row) = (char *)malloc(n * sizeof(char));
				for (int col = 0; col < n; col++)
				{
					// char* word = "FLORIDA";

					// if (strstr(*(arr + row), word) != 0) {
					// 		// printf("OMG %s\n", *(arr + row));
					// 	}

					if ((*(*(list + words) + letter)) >= 97)
					{

						char tempChar = (char)malloc((1) * sizeof(char));
						tempChar = (*(*(list + words) + letter + 1));
						tempChar = (char)(tempChar - 32);
						printf("%c", tempChar);	
						*(tempStr + letter) = *(*((arr + row) + col));

						if (*(*(arr + row) + col) == tempChar)
						{

							if(*(*(list + words) + letter) ==  *(*(arr + row - 1) + col)){
								*(tempStr + letter + 1) = *(*(arr + row + 1) + col);
								tempChar = (*(*(list + row + 1) + col));
								tempChar = (char)(tempChar - 32);
							} else if(){

							}

							int directionType = 0;
							switch (directionType)
							{
							case 0: // down
								// searchPuzzle(((arr + row + 1) + col), n, ((list + words) + letter + 1), listSize);
								// tempStr += *(*(list + words) + letter + 1);
								*(tempStr + letter + 1) = *(*(arr + row + 1) + col);
								tempChar = (*(*(list + row + 1) + col));
								tempChar = (char)(tempChar - 32);
								break;
							case 1: // left
								searchPuzzle(((arr + row) + col - 1), n, ((list + words) + letter + 1), listSize);
								tempStr += *(*(list + words) + letter + 1);
								break;
							case 2: // right
								searchPuzzle(((arr + row) + col + 1), n, ((list + words) + letter + 1), listSize);
								tempStr += *(*(list + words) + letter + 1);
								break;
							case 3: // down left
								searchPuzzle(((arr + row + 1) + col - 1), n, ((list + words) + letter + 1), listSize);
								tempStr += *(*(list + words) + letter + 1);
								break;
							case 4: // down right
								searchPuzzle(((arr + row + 1) + col + 1), n, ((list + words) + letter + 1), listSize);
								tempStr += *(*(list + words) + letter + 1);
								break;
							}
							directionType++;
							tempChar = (*(*(list + row) + col));
							tempChar = (char)(tempChar - 32);

							if (*(*(list + words) + letter) == 0)
							{
								*(foundList + words) = tempStr;
							}
						}
					}
				}
			}
		}
	}
}
