#include <iostream>
#include <climits>
using namespace std;

int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

void printBinary(void* arr, int size, int val) {
    int i = 0;
    while (i < size) {
        *((int*)arr + i) = val;
        i++;
    }
}
int main() {
    const int size = sizeof arr / sizeof * arr;
    void* p = static_cast<void*>(arr);

    printBinary(p, size, 10);

    int i = 0;
    while (i < size) {
        cout << arr[i] << endl;
        i++;
    }
    return 0;
}