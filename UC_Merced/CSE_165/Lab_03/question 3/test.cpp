#include "stackInt.h"
#include <iostream>

int main() {
    using namespace std;
    StackInt stack;

    stack.init();
    
    int i = 0;
    while(i < 5){
        stack.push(i);
        ++i;
    }

    while (stack.size() > 0)
        cout << stack.pop() << endl;
}