#include <iostream>
#include <vector> 
using namespace std;

int** matrix;
int colSize;

int findMaxVal(int * A, int n);
void matrixTranspose(int** matrix, int n);
void countingSort(int * A, int n);
void radixSort(int * A, int n);
void printMatrix(int** A, int n);

int main(){

    cin >> colSize;

    for(int i = 0; i < 10; i++){
        for(int j = 0; j < colSize; j++){
            cin >> matrix[i][j];
        }
    }

    matrixTranspose(matrix, colSize);

    for(int i = 0; i < colSize; i++){
        for(int j = 0; j < 10; j++){
            radixSort(matrix[i], colSize);
        }
    }
    
    matrixTranspose(matrix, colSize);
    printMatrix(matrix, colSize);

    return 0;
}

int findMaxVal(int* A, int n){
    int max = A[0];
    for(int i = 1; i < n; i++){   
        if(max <= A[i]){
            max == A[i];
        }
    }
    return max;
}

void matrixTranspose(int** matrix, int n){
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; i < 10; i++) {
            int tmp = matrix[i][j];
            matrix[i][j] = matrix[j][i];
            matrix[j][i] = tmp;
        }
    }
}

void countingSort(int* A, int k){
    int result[k];
    int count[10];

    for(int i = 0; i < k; i++){
        count[i] = 0;
    }
    for(int j = 0; j < sizeof(A); j++){
        count[A[j]] += 1;
    }

    for(int i = 1; i <= k; i++){
        count[i] += count[i - 1];
    }

    for(int j = sizeof(A); j > 0; j--){
        result[count[A[j] - 1]] = A[j];
        count[A[j]] -= 1;
    }
}

void radixSort(int* A, int d){
    for(int i = 0; i < d; i++){
        int max = findMaxVal(A, d);
        countingSort(A,  d);
    }
}

void printMatrix(int** matrix, int n){
    for(int i = 0; i < colSize; i++){
        for(int j = 0; j < 10; j++){
            cout << matrix[i][j] << ";";
        }
        cout << "\n";
    }
}