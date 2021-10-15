#include <iostream>
#include <ctime>
using namespace std;

class Parent {
public:
    virtual void printClass() {
        cout << "Parent class" << endl;
    }
};

class Child : public Parent {
public:
    virtual void printClass() {
        cout << "Child class" << endl;
    }
};

int main() {
    Child child;
    Parent* parent = &child;
    clock_t virtual_function_start, virtual_function_end, non_virtual_function_start, non_virtual_function_end;

    cout << "virtual function execution: \n";
    virtual_function_start = clock();
    size_t i = 0;
    while (i < 2000) {
        child.printClass();
        i++;
    }
    virtual_function_end = clock();

    cout << "Non-virtual function execution: \n";
    non_virtual_function_start = clock();
    size_t j = 0;
    while (j < 2000) {
        parent->printClass();
        j++;
    }
    non_virtual_function_end = clock();

    cout << "Virtual function execution time: " << (double)(virtual_function_end - virtual_function_start) / CLOCKS_PER_SEC << endl;
    cout << "Non-virtual function execution time: " << (double)(non_virtual_function_end - non_virtual_function_start) / CLOCKS_PER_SEC << endl;
}
