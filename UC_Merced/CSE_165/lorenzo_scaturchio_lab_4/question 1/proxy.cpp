#include <iostream>
using namespace std;

class Subject {
public:
    virtual void f() = 0;
    virtual void g() = 0;
    virtual void h() = 0;
};

class Proxy : public Subject {
    Subject* proxySub;
public:
    Proxy(Subject* proxySub = 0) {
        this->proxySub = proxySub;
    }
    void setSubject(Subject* proxySub) {
        this->proxySub = proxySub;
    }
    void f() {
        proxySub->f();
    }
    void g() {
        proxySub->g();
    }
    void h() {
        proxySub->h();
    }
};


class Implementation1 : public Subject {
public:
    void f() {
        cout << "Implementation1::f\n";
    }
    void g() {
        cout << "Implementation1::g\n";
    }
    void h() {
        cout << "Implementation1::h\n";
    }
};

class Implementation2 : public Subject {
public:
    void f() {
        cout << "Implementation2::f\n";
    }
    void g() {
        cout << "Implementation2::g\n";
    }
    void h() {
        cout << "Implementation2::h\n";
    }
};

int main() {
    Implementation1 impl1;
    Proxy proxy(&impl1);
    proxy.f();
    proxy.g();
    proxy.h();

    Implementation2 impl2;
    proxy.setSubject(&impl2);
    proxy.f();
    proxy.g();
    proxy.h();
}