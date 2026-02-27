#include <iostream>
#include <climits>
using namespace std;

void printBinary(float x) {
    unsigned char* p = reinterpret_cast<unsigned char*>(&x);
    int numBit = 0;
    int i = sizeof(float) - 1;

    while (i >= 0) {
        int j = CHAR_BIT - 1;
        while (j >= 0) {
            cout << !!(p[i] & (1 << j));
            if (numBit == 0 || numBit == 8) {
                cout << ' ';
            }
            --j;
            ++numBit;
        }
        --i;
    }
    cout << endl;
}