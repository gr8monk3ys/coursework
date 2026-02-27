class A {
    int i;
public:
    A(int u) : i(u) {}
    ~A() {}
    void f() const {}
};

class B {
    int i;
public:
    B(int u) : i(u) {}
    ~B() {}
    virtual void f() const {}
};

class C : public B {
    A a;
public:
    C(int u) : B(u), a(u) {}
    ~C() {}
    void f() const {
        a.f();
        B::f();
    }
};

void foo(B b) {
    b.f();
}

int main() {
    C c(21);
    foo(c);
}
