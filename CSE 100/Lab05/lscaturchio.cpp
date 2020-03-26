#include <iostream>
#include <cmath>
using namespace std;

const int rowSize = 10;
int colSize;

int findMaxVal(int a, int b){
    if(a > b){
        return a;
    }
    return b;
}

void matrixTranspose(int** matrix){
    for (int i = 0; i < colSize; i++) {
        for (int j = i + 1; i < 10; i++) {
            int tmp = matrix[i][j];
            matrix[i][j] = matrix[j][i];
            matrix[j][i] = tmp;
        }
    }
}

int* matrixConvert(int* A){
    for(int i = 0; i < colSize; ++i){
        int iterValue = 0;
        for(int j = 0; j < rowSize; j++){
            int input;
            cin >> input;
            iterValue += input * (long)pow(10, 9 - j);
        }
        A[i] = iterValue;
    }

    return A;
}

void countingSort(int* A, int k){
    int result[colSize];
    int count[10] = {0};
    int i;

    for(i = 0; i < colSize; i++){
        count[(A[i] / k) % 10]++;
    }

    for(i = 1; i < rowSize; i++){
        count[i] += count[i - 1];
    }

    for(i = colSize - 1; i >= 0; i--){
        result[count[(A[i] / k) % 10 - 1]] = A[i];
        count[(A[i] / k) % 10] -= 1;
    }

    for(i = 0; i < colSize; i++){
        A[i] = result[i];
    }
}

void radixSort(int* A){
    int max = INT16_MIN;

    for(int i = 0; i < colSize; i++){
        max = findMaxVal(max, A[i]);
    }  
    
    for(int j = 1; max / j > 0; j *= 10){
        countingSort(A,  j);
    }
}

void printMatrix(int* A){
    for(int i = 0; i < colSize; i++){
        int iterVal= A[i];
        int maxVal = INT16_MAX;
        int totVal = iterVal - (iterVal % maxVal);
        while(maxVal > 0){
            cout << (totVal / maxVal) << ";";
            iterVal -= totVal;
            maxVal /= 10;
        }
        cout << "\n";
    }
}

int main(){

    cin >> colSize;
    int matrix[colSize];

    int* colMatrix = matrixConvert(matrix);

    // matrixTranspose(matrix);

    // radixSort(colMatrix);

    // matrixTranspose(matrix);
    printMatrix(colMatrix);

    return 0;
}