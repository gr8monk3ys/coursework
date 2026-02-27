#include <iostream>
#include <cassert>
using namespace std;

int fibonacci(bool reset = false) {
    static int n1 = 0;
    static int n2 = 1;
    static int count = 0;
    int result;

    if (reset == true) {
        n1 = count = 0;
        n2 = 1;
    }
    if (count == 0) {
        assert(n1 == 0 && n2 == 1);
        result = 0;
    }
    else if (count == 1) {
        assert(n1 == 0 && n2 == 1);
        result = 1;
    }
    else {
        result = n1 + n2;
        n1 = n2;
        n2 = result;
    }
    ++count;

    return result;
}

int main() {

    int i = 0;
    while (i < 10) {
        cout << fibonacci() << ' ' << endl;
        ++i;
    }

    cout << fibonacci(true) << ' ' << endl;
    int j = 0;
    while (j < 5) {
        cout << fibonacci() << ' ' << endl;
        ++j;
    }
}