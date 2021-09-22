#include <iostream>
#include <climits>
using namespace std;

void printBinary(unsigned char val) {
    for (int i = CHAR_BIT - 1; i >= 0; i--)
        cout << "01"[!!(val & (1 << i))];
