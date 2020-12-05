#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void printArr(int *a, int size){
    printf("print Arr: ");
	for(int j = 0; j < size; j++){
        printf("%d ", *(a+j));
    }
}

int* arrCopy(int *a, int size){
	int *arr_copy = (int *) malloc(size * sizeof(int));
    for(int k = 0; k < size; k++){
        *(arr_copy + k) = *(a + k);
    }
    return arr_copy;
}

int main(){
    int n;
    int *arr;
    int *arr_copy;
    int i;
    printf("Enter size of array:\n");
    scanf("%d",&n);

    //Dynamically create an int array of n items
    arr = (int*) malloc(n * sizeof(int));

    //Ask user to input content of array
    for(i = 0; i < n; i++){
        printf("Enter content for item #%d: ", i + 1);
        scanf("%d", (arr + i));
    }

    printf("\n");
	
/*************** YOU MUST NOT MAKE CHANGES BEYOND THIS LINE! ***********/
	
	//printf original array
    printArr(arr, n);

	//Copy array
    arr_copy = arrCopy(arr, n);

	//printf new array
    printArr(arr_copy, n);

    return 0;
}