#include <iostream>
using namespace std;

class ContainsArr {
public:
    enum { len = 5 };
    int arr[len];
    ContainsArr() {
        int i = 0;
        while (i < len) {
            arr[i] = i;
            ++i;
        }
    }
};

int main() {
    ContainsArr h;
    int(ContainsArr:: * pa)[5] = &ContainsArr::a;
    int i = 0;
    while (i < ContainsArr::len) {
        cout << (h.*pa)[i] << ' ';
        ++i;
    }
    cout << endl;
}
