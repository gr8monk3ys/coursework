#include <iostream>
#include <vector>
using namespace std;

int n;

int findMinMult(int *vals, vector<vector<int>> &matrix, vector<vector<int>> &sequence, int size)
{
    int i, j, k, L, q;

    for (i = 1; i < size; i++)
    {
        matrix[i][i] = 0;
    }
    for (L = 2; L < size; L++)
    {
        for (i = 1; i < size - L + 1; i++)
        {
            j = i + L - 1;
            matrix[i][j] = 10000000;
            for (k = i; k <= j - 1; k++)
            {
                q = matrix[i][k] + matrix[k + 1][j] +
                    (vals[i - 1] * vals[k] * vals[j]);
                if (q < matrix[i][j])
                {
                    matrix[i][j] = q;
                    sequence[i][j] = k;
                }
            }
        }
    }
    return matrix[1][n];
}
void printSequence(vector<vector<int>> &sequence, int row, int col)
{
    if (row == col)
    {
        cout << "A" << (row - 1);
    }
    else
    {
        cout << "(";
        printSequence(sequence, row, sequence[row][col]);
        printSequence(sequence, sequence[row][col] + 1, col);
        cout << ")";
    }
}

int main()
{
    cin >> n;
    int vals[n];

    for (int i = 0; i <= n; i++)
    {
        cin >> vals[i];
    }

    int size = n + 1;

    vector<vector<int>> matrix;
    matrix.resize(size, vector<int>(size, 0));
    vector<vector<int>> sequence;
    sequence.resize(size, vector<int>(size, 0));

    cout << findMinMult(vals, matrix, sequence, size) << "\n";
    printSequence(sequence, 1, n);
    cout << "\n";

    return 0;
}
