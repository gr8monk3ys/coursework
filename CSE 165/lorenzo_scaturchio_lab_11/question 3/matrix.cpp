#include<bits/stdc++.h>

using namespace std;

class Matrix {
private:
    vector<vector<int>> Mat;
    int m, n;
public:
    Matrix(int n, int m) {
        this->m = m;
        this->n = n;
        this->Mat.resize(n);
        for (auto& x : this->Mat) {
            x.resize(m);
        }
    }
    Matrix() :Matrix(0, 0) {}

    ~Matrix() {
        this->n = 0;
        this->m = 0;
        this->Mat.clear();
    }
    friend ostream& operator<<(ostream& out, const Matrix& Mat);
    friend istream& operator>>(istream& input, Matrix& Mat);
    friend Matrix operator*(const Matrix& l, const vector<int>& r);
    friend Matrix operator*(const Matrix& l, const Matrix& r);
    friend Matrix operator+(const Matrix& l, const Matrix& r);
};

Matrix operator+(const Matrix& l, const Matrix& r) {
    if (l.m == r.m && l.n == r.n) {
        Matrix res(l.n, l.m);
        for (int i = 0;i < l.n;i++) {
            for (int j = 0;j < l.m;j++) {
                res.Mat[i][j] = l.Mat[i][j] + r.Mat[i][j];
            }
        }
        return res;
    }
    else {
        Matrix res;
        cout << "Row Column Mismatched: empty matrix" << endl;
        return res;
    }
}

Matrix operator*(const Matrix& l, const Matrix& r) {
    if (l.m == r.n) {
        Matrix res(l.n, r.m);
        for (int i = 0; i < l.n; i++) {
            for (int j = 0; j < r.m; j++) {
                for (int k = 0; k < r.n; k++) {
                    res.Mat[i][j] += l.Mat[i][k] * r.Mat[k][j];
                }
            }
        }
        return res;
    }
    else {
        Matrix res;
        cout << "Row Column Mismatched: empty matrix" << endl;
        return res;
    }
}

Matrix operator*(const Matrix& l, const vector<int>& r) {
    if (l.m == r.size()) {
        Matrix res = l;
        for (auto& x : res.Mat) {
            for (int i = 0;i < r.size();i++) {
                x[i] *= r[i];
            }
        }
        return res;
    }
    else {
        Matrix res;
        cout << "Row Mismatched with vector size resulted empty matrix" << endl;
        return res;
    }
}

istream& operator>>(istream& input, Matrix& Mat) {
    cout << "Enter matrix with " << Mat.m << " rows and " << Mat.n << " columns\n";
    for (int i = 0;i < Mat.n;i++) {
        for (int j = 0;j < Mat.m;j++) {
            input >> Mat.Mat[i][j];
        }
    }
    return input;
}

ostream& operator<<(ostream& out, const Matrix& Mat) {
    for (int i = 0;i < Mat.n;i++) {
        for (int j = 0;j < Mat.m;j++) {
            out << Mat.Mat[i][j] << " ";
        }
        out << "\n";
    }
    return out;
}

int main() {
    Matrix m1(2, 2);
    Matrix m2(2, 3);
    Matrix m3(3, 2);
    cin >> m1;
    cin >> m2;
    cin >> m3;
    Matrix r1 = m1 + m2;
    cout << r1;
    Matrix r2 = m2 + m3;
    cout << r2;
    Matrix r3 = m1 * m3;
    cout << r3;
    Matrix r4 = m1 * m2;
    cout << r4;
    vector<int> v1 = {1,2,3};
    Matrix res5 = m1 * v1;
    cout << res5;
    return 0;
}