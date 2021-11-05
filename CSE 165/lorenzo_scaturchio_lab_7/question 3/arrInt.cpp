#include <iostream>
using namespace std;

class ArrHold {
    static const int size = 6;
    const int val;
    static int number;
    int arr[size] = {0,1,2,3,4,5};
public:
    ArrHold() : val(20) {}

    static void printNum() {
        cout << "static int: " << number << endl;
    }

    inline void printArr() {
        cout << "Array: ";
        int i = 0;
        while (i < size) {
            cout << arr[i] << ' ';
            i++;
        }
        cout << endl;
        printNum();
    }
};

int ArrHold::number = 12;

int main() {
    ArrHold a;
    a.printArr();
    return 0;
}