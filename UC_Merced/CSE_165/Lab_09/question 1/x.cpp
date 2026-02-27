#include <iostream>
using namespace std;

class X {
    int x;
public:
    X(int xVar) : x(xVar) {}
    void f() { cout << "X::f()" << endl; }
};

class Y : public X {
    int y;
public:
    Y(int yVar) : X(yVar), y(yVar) {}
    void f() { cout << "Y::f()" << endl; }
};

class Z : public X {
    int z;
public:
    Z(int zVar) : X(zVar), z(zVar) {}
    void f() { cout << "Z::f()" << endl; }
};

class A : public Y, public Z {
    int a;
public:
    using Z::f;
    A(int aVar) : Y(aVar), Z(aVar), a(aVar) {}
};

int main() {
    A a(1);
    a.f();
    return 0;
}