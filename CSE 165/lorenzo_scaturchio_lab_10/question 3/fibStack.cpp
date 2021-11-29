#include <iostream>
#include<stack>
using namespace std;

int main() {
    int n;
    cout << "Enter n: ";
    cin >> n;
    int size = n;

    int a = 0;
    int b = 1;

    stack<int> s;
    s.push(a);
    s.push(b);

    while (n > 0) {
        int c = a + b;
        s.push(c);
        a = b;
        b = c;
        n--;
    }

    int arr[50];
    int i = 0;
    while (!s.empty()) {
        arr[i] = s.top();
        s.pop();
        i++;
        n--;
    }

    for (int i = (size + 1); i >= 0; i--) {
        cout << arr[i] << " ";
    }
    return 0;
}