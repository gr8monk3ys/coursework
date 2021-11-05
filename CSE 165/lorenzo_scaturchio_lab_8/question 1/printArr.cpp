#include <iostream>
#include <cstring>
using namespace std;

class PrintArr {
    enum { size = 5 };
    char arr[size];
public:
    PrintArr(char c = ' ') { memset(arr, c, size); }

    void print() {
        int i = 0;
        while (i < size) {
            cout << arr[i] << ' ';
            i++;
        }
        cout << endl;
    }
};

int main() {
    PrintArr a('a');
    a.print();
    return 0;
}