#include "stackInt.h"
#include <iostream>

int main() {
    using namespace std;
    StackOfInt stk;

    stk.init();
    for (int i = 0; i < 5; ++i)
        stk.push(i);

    while (stk.size() > 0)
        cout << stk.pop() << endl;
}