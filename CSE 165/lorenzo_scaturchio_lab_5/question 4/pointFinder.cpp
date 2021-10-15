#include <iostream>
#include<bits/stdc++.h>
using namespace std;

class first {
public:
    int a, b, c, d;

    first() {
        a = 0, b = 1, c = 2, d = 3;
    }
    virtual void printClass() {
        cout << "first class: ";
        cout << a << " " << b << " " << c << " " << d << endl;
    }
    virtual void printEnd() {
        cout << "End of first class" << endl << '\n';
    }
};

class second : public first {
public:
    int e, f;
    second() {
        e = 4, f = 5;
    }
    void printClass() {
        cout << "second class: ";
        cout << e << " " << f << endl;
    }
    void printEnd() {
        cout << "End of second class" << endl << '\n';
    }
};

int main() {
    first f;
    first* pointer;

    cout << "pointer points to first class:" << endl;
    pointer = &f;
    pointer->printClass();
    pointer->printEnd();

    second s;

    cout << "pointer points to second class:" << endl;
    pointer = &s;
    pointer->printClass();
    pointer->printEnd();
}