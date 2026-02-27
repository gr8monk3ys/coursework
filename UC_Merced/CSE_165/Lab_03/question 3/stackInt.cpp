#include "stackInt.h"
#include <vector>
using namespace std;

// Complete the incomplete type StackImplementation:
// (This could be in a separate header file)
struct StackImplementation {
    enum { MAXSIZE = 100 };
    vector<int> data;
};

void StackInt::init() {
    pImplementation = new StackImplementation;
}

int StackInt::push(int x) {
    if (pImplementation->data.size() == StackImplementation::MAXSIZE)
        return STKERROR;
    else {
        pImplementation->data.push_back(x);
        return x;
    }
}

int StackInt::pop() {
    if (pImplementation->data.size() == StackImplementation::MAXSIZE)
        return STKERROR;
    else {
        int x = pImplementation->data.back();
        pImplementation->data.pop_back();
        return x;
    }
}

int StackInt::top() {
    return (pImplementation->data.size() == StackImplementation::MAXSIZE)
        ? STKERROR
        : pImplementation->data.back();
}

size_t StackInt::size() {
    return pImplementation->data.size();
}

void StackInt::cleanup() {
    delete pImplementation;
}
