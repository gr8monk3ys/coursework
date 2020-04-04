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

char *toUpper(char **list, char *word, int i)
{
	for (int j = 0; j < strlen(*(list + i)); j++)
	{
		*(word + j) = *(*(list + i) + j);
		if (*(*(list + i) + j) >= 97)
		{
			*(word + j) = *(*(list + i) + j) - 32;
		}
	}
	return word;
}

char *toLower(char **list, char *word, int i)
{
	for (int j = 0; j < strlen(*(list + i)); j++)
	{
		*(word + j) = *(*(list + i) + j);
		if (*(*(list + i) + j) < 97)
		{
			*(word + j) = *(*(list + i) + j) + 32;
		}
	}
	return word;
}

void searchPuzzle(char **arr, int n, char **list, int listSize)
{
	for (int i = 0; i < listSize; i++)
	{
		char *word = (char *)malloc((listSize + 1) * sizeof(char *));
		char *tempWord = (char *)malloc((listSize + 1) * sizeof(char *));

		int wordLen = 0;

		toUpper(list, word, i);

		int letterCount = 0;
		int isWord = 0;
		wordLen = strlen(word);

		for (int j = 0; j < wordLen; j++)
		{

			if (isWord == 1)
			{
				toLower(list, word, i);
				printf("word found: %s\n", word);
				break;
			}
			else
			{
				for (int row = 0; row < n - 1; row++)
				{
					for (int col = 0; col < n - 1; col++)
					{
						if (*(*(arr + row) + col) == *(word + j)) // if letter of puzzle is letter of word
						{

							if (*(word + j) % wordLen == wordLen)
							{
								*(tempWord + j) = *(*(arr + row) + col);
								*(*(arr + row) + col) += 32;
							}

							if ((*word + (j + 1)) == *(*(arr + row) + col + 1) && col < n) // if list prev letter is right
							{
								*(tempWord + (j + 1)) = *(*(arr + row) + col - 1); // set temp string as left value
								letterCount++;
							}
							else if ((*word + (j + 1)) == *(*(arr + row) + col - 1) && col > 0) // if list prev letter is left
							{
								*(tempWord + (j + 1)) = *(*(arr + row) + col + 1); // set temp string as right value
								letterCount++;
							}

							if (row > 0 && row < n)
							{
								if ((*word + (j + 1)) == *(*(arr + row - 1) + col + 1)) // if list prev letter is top right
								{
									*(tempWord + (j + 1)) = *(*(arr + row + 1) + col - 1); // set temp string as bottom left value
									letterCount++;
								}
								else if ((*word + (j + 1)) == *(*(arr + row - 1) + col - 1)) // if list prev letter is top left
								{
									*(tempWord + (j + 1)) = *(*(arr + row + 1) + col + 1); // set temp string as bottom right value
									letterCount++;
								}
								else if ((*word + (j + 1)) == *(*(arr + row - 1) + col)) // if list prev letter is above
								{
									*(tempWord + (j + 1)) = *(*(arr + row + 1) + col); // set temp string as below value
									letterCount++;
								}
							}
						}
					}
				}
			}

			if (letterCount == wordLen)
			{
				isWord = 1;
			}
		}
	}
}