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

    int j = (size + 1);
    while(j >= 0){
        cout << arr[j] << ' ';
        j--;
    }
    return 0;
}