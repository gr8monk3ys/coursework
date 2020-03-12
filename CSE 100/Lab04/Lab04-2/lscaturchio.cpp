#include <iostream>
using namespace std;

// setting up global variables
int *arr;
int n = 0;

void swap(int* a, int* b);
int partition(int* A, int p, int r);
void quickSort(int* A, int p, int r);

int main(){

    // Get the size of the sequence
    cin >> n;
    arr = new int[n];
    int A[n];

    // Read full sequence
    for (int i = 0; i < n; i++){
        cin >> A[i];
    }  

    // Calling the function from the array size
    quickSort(A, 0, n - 1);
    for(int i = 0; i < n; i++){
        cout << A[i] << ";";
    }

    return 0;

    // Free allocated space
    delete[] arr;
}

void swap(int* a, int* b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int partition(int* A, int p, int r){
    int pivot = A[r];
    int i = (p - 1);

    for(int j = p; j <= r - 1; j++){
        if(A[j] < pivot){
            i++;
            swap(A[i], A[j]);
        }
    }
    swap(A[i + 1], A[r]);
    return(i + 1);
}

void quickSort(int* A, int p, int r){
    if(p < r){
        int q = partition(A, p, r);
        quickSort(A, p, q - 1);
        quickSort(A,q + 1, r);
    }
}