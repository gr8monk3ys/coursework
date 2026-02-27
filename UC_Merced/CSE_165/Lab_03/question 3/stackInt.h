#include <cstddef>
#include <climits>

#ifndef _MSC_VER
using std::size_t;
#endif

struct StackImplementation;

struct StackInt {
    enum {STKERROR = INT_MIN};
    void init();
    void cleanup();
    int push(int);
    int pop();
    int top();
    size_t size();

private:
    StackImplementation* pImplementation;
};