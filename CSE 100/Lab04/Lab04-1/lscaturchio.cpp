#include <iostream>
using namespace std;

// setting up global variables
int *arr;
int n = 0;

void swap(int* a, int* b);
void maxHeapify(int* A, int i, int n);
void heapSort(int* A, int n);

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
    heapSort(A, n);
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

void maxHeapify(int* A, int i, int n){
    int l = (2*i + 1);
    int r = (2*i + 2);
    int max = i;
    
    if(l < n && A[l] > A[i]){
        max = l;
    }
    
    if(r < n && A[r] > A[max]){
        max = r;
    }

    if(max != i){
        swap(A[max], A[i]);
        maxHeapify(A, max, n);
    } 
}

void heapSort(int* A, int n){
    for(int i = ((n /2) - 1); i >= 0; i--){
        maxHeapify(A,i, n);
    }
    for(int i = (n - 1); i >= 0; i--){
        swap(A[0], A[i]);
        maxHeapify(A,0, i);
    }      
}