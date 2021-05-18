#include <iostream>
using namespace std;

// Setting up global variables
int *arr;
int n = 0;

// Function declaration
void merge(int *A, int p, int q, int r);
void mergeSort(int *A, int p, int r);

int main(int argc, char **argv){

    // Get the size of the sequence
    cin >> n;
    arr = new int[n];
    int A[n];

    // Read full sequence
    for (int i = 0; i < n; i++){
        cin >> A[i];
    }   

    mergeSort(A, 0, n - 1);

    for(int l = 0; l < n; l++){
        cout << A[l] << ";";
    }

    // Free allocated space
    delete[] arr;

    return 0;
}

void merge(int *A, int p, int q, int r){
    // Identify the halves
    int leftLength = q - p + 1;
    int rightLength = r - q;
    int i, j, k;
    int lA[leftLength], rA[rightLength];

    for(i = 0; i < leftLength; i++){
        lA[i] = A[p + i];
    }

    for(j = 0; j < rightLength; j++){
        rA[j] = A[q + j + 1];
    }

    lA[leftLength] = 2147483647;
    rA[rightLength] = 2147483647; 

    //Compare the three indexes with eachother to place in the merge array

    i = 0;
    j = 0;
    k = p;

    for (k = p; k < (r + 1); k++){
        if (lA[i] <= rA[j]){
            A[k] = lA[i];
            i++;
        }
        else{
            A[k] = rA[j];
            j++;
        }
    }
}

// This is the function that cuts the indexes recursively in half

void mergeSort(int *A, int p, int r){
    if(p < r){
        int q = ((p + (r - 1)) / 2);

        mergeSort(A,p,q);
        mergeSort(A, q + 1, r);
        merge(A,p,q,r);
    }
}
