#include <iostream>
#include <cmath>
using namespace std;

const int rowSize = 10;
int colSize;

void matrixTranspose(long** matrix){
    for (int i = 0; i < colSize; i++) {
        for (int j = i + 1; i < rowSize; i++) {
            long tmp = matrix[i][j];
            matrix[i][j] = matrix[j][i];
            matrix[j][i] = tmp;
        }
    }
}

long* matrixConvert(long* A){
    for(int i = 0; i < colSize; ++i){
        long iterValue = 0;
        for(int j = 0; j < rowSize; j++){
            long input;
            cin >> input;
            iterValue += input * (long)pow(10, 9 - j);
        }
        A[i] = iterValue;
    }

    return A;
}

void countingSort(long* A, long pos)
{
    long result[colSize]; 
    long count[10] = {0}; 
    int i;

    for (i = 0; i < colSize; i++){
        count[(A[i] / pos) % 10]++;
    }
    for (i = 1; i < 10; i++){
        count[i] += count[i-1];
    }
    for (i = colSize - 1; i >= 0; i--){
        result[count[(A[i] / pos) % 10] - 1] = A[i];
        count[(A[i] / pos) % 10]--;
    }
    for (i = 0; i < colSize; i++){
        A[i] = result[i];
    }
}

long findMaxVal(long a, long b){
    if(a > b){
        return a;
    }
    return b;
}

void radixSort(long* A){
    long max = -1000000;
    long pos = 1;
    long pass = 1;
    for (int i = 0; i < colSize; i++){
        max = findMaxVal(max, A[i]);
    }
    for(int j = 1; max / j > 0; j *= 10){
        countingSort(A,  j);
        pass++;
    }
}

void printMatrix(long* A){
    for(int i = 0; i < colSize; i++){
        long iterVal= A[i];
        long maxVal = 1000000000;
        while(maxVal > 0){
            cout << ((iterVal - (iterVal % maxVal)) / maxVal) << ";";
            iterVal -= (iterVal - (iterVal % maxVal));
            maxVal /= 10;
        }
        cout << "\n";
    }
}

int main(){

    cin >> colSize;
    long matrix[colSize];
    long* colMatrix = matrixConvert(matrix);

    radixSort(matrix);
    printMatrix(matrix);

    return 0;
}