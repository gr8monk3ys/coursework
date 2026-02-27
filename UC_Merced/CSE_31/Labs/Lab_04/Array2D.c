#include <stdio.h>
#include <malloc.h>

void printArray(int**, int);

int main() {
	int i = 0, j = 0, n = 5;
	int** arr = (int**)malloc(n * sizeof(int*));

	// (3) Add your code to complete allocating and initializing the 2-D array here. The content should be all 0.
	for(i = 0; i < n; i++){
		*(arr + i) = (int*)malloc(n * sizeof(int));
		for(j = 0; j < n; j++){
			*(*(arr + i) + j) = 0;
		}
	}

	// (5) All printArray to print array
	printArray(arr, n);

    // (6) Add your code to make arr a diagonal matrix
    for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			if(i == j){
				*(*(arr + i) + j) = 1;
			} else {
				*(*(arr + i) + j) = 0;
			}
		}
	}	
	
	// (7) All printArray to print array
    printArray(arr, n);

	for(int i = 0; i < n; i++){
		free(*(arr + i));
	}
	free(arr);

	return 0;
}

void printArray(int ** array, int size){
    // (5) Implement your printArr here:
	for(int i = 0; i < size; i++){
		for(int j = 0; j < size; j++){
			printf("%d", *(*(array + i) + j));
			if(j == size){
				printf("\n");
			}
		}
		printf("\n");
	}
	printf("\n");
}
