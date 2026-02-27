#include <iostream>
using namespace std;

void convert(int& p) {
    p = 10;
}

int main() {
    int p = 5;

    convert(p);
    cout << "pointer = " << p << "\nwith destination: " << &p << endl;
    return 0;
}
