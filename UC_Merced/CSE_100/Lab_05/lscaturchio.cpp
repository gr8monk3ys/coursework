#include <iostream>
#include <cmath>
using namespace std;

const int rowSize = 10;
int colSize;

void matrixTranspose(long **matrix)
{
    for (int i = 0; i < colSize; i++)
    {
        for (int j = i + 1; i < rowSize; i++)
        {
            long tmp = matrix[i][j];
            matrix[i][j] = matrix[j][i];
            matrix[j][i] = tmp;
        }
    }
}

long *matrixIterate(long *A)
{
    for (int i = 0; i < colSize; ++i)
    {
        long iterValue = 0;
        long input;
        for (int j = 0; j < rowSize; j++)
        {
            cin >> input;
            iterValue += input * pow(10, 9 - j);
        }
        A[i] = iterValue;
    }

    return A;
}

void countingSort(long *A, long k)
{
    long count[rowSize] = {0};
    long result[colSize];

    for (int i = 0; i < colSize; i++)
    {
        count[(A[i] / k) % rowSize] += 1;
    }
    for (int j = 1; j < rowSize; j++)
    {
        count[j] += count[j - 1];
    }
    for (int l = colSize - 1; l >= 0; l--)
    {
        result[count[(A[l] / k) % rowSize] - 1] = A[l];
        count[(A[l] / k) % rowSize] -= 1;
    }
    for (int m = 0; m < colSize; m++)
    {
        A[m] = result[m];
    }
}

long findMaxVal(long *A)
{
    long max = A[0];
    for (int i = 0; i < colSize; i++)
    {
        if (A[i] > max)
        {
            max = A[i];
        }
    }
    return max;
}

void radixSort(long *A)
{
    long preventSeg = 1;
    long max = findMaxVal(A);

    for (int j = 1; max / j > 0; j *= 10)
    {
        countingSort(A, j);
        preventSeg++;
    }
}

void printMatrix(long *A)
{
    for (int i = 0; i < colSize; i++)
    {
        long iterVal = A[i];
        for (long maxVal = 1 * pow(10, 9); maxVal > 0; maxVal /= rowSize)
        {
            long totVal = (iterVal - (iterVal % maxVal));
            cout << (totVal / maxVal) << ";";
            iterVal -= totVal;
        }
        cout << "\n";
    }
}

int main()
{

    cin >> colSize;
    long matrix[colSize];
    matrixIterate(matrix);
    radixSort(matrix);
    printMatrix(matrix);

    return 0;
}