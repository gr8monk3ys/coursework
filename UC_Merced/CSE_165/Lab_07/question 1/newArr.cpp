#include <iostream>
using namespace std;

int f(int* p = NULL) {
    static int* arr = NULL;
    static int i = 0;

    if (p != NULL) {
        arr = p;
        i = 0;
    }
    if (arr == NULL || arr[i] == -1) {
        return -1;
    }

    return arr[i++];
}

int arr[] = {2,5,1,2,6,-1};

int main() {
    f(arr);
    int p = arr[0];

    while (p != -1) {
        cout << p << endl;
        p = f();
    }
}