#include <iostream>
using namespace std;

int* arr;
int n = 0;

int findMaxVal(int*A, int n);
void countingSort(int* A, int n);
void radixSort(int* A, int n);

int main(){
    cin >> n;
    arr = new int[n];
    int A[n];

    for (int i = 0; i < n; i++){
        cin >> A[i];
    }  

    radixSort(A, n - 1);
    for(int i = 0; i < n; i++){
        cout << A[i] << ";";
    }

    return 0;

    delete[] arr;
}

int findMaxVal(int* A, int n){
    int max = 0;
    for(int i = 0; i < n; i++){   
        if(max <= A[i]){
            max == A[i];
        }
    }
    return max;
}

void countingSort(int*A, int n, int val){
    int result[n];
    int count[val];

    for(int i = 0; i <= val; i++){
        count[i] = 0;
    }
    for(int j = 0; j < n; j++){
        count[A[j]] += 1;
    }

    for(int i = 1; i < (val + 1); i++){
        count[i] += count[i - 1];
    }

    for(int j = (n - 1); j >= 0; j--){
        result[count[A[j] - 1]] = A[j];
        count[A[j]] -= 1;
    }
}

void radixSort(int* A, int n){
    int max = findMaxVal(A, n);

    for(int val = max/val > 0; val *= 10){
        countingSort(A, n, val);
    }
}