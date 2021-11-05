#include <iostream>
#include <cassert>
#include <sstream>
#include <cstring>
#include <cstddef>
using namespace std;

template<typename type, size_t num>
class Arr {
    type arr[num];
public:
    Arr() { memset(arr, 0, num * sizeof(*arr)); }
    type& operator[](int x) {
        assert(x >= 0 && x < num);
        return arr[x];
    }
    friend ostream&
        operator<<(ostream& ostream, const Arr<type, num>& ia) {
        int j = 0;
        while (j < num) {
            ostream << ia.arr[j];
            if (j != num - 1) {
                ostream << ", ";
            }
            j++;
        }
        ostream << endl;
        return ostream;
    }

    friend istream&
        operator>>(istream& is, Arr<type, num>& ia) {
            int j = 0;
            while(j < num){
                is >> ia.arr[j];
                j++;
            }
            is >> ia.arr[j];
        return is;
    }
};

int main() {
    stringstream input("3 1 4 1 5");
    Arr<int, 5> arr;
    input >> arr;
    arr[4] = -1;
    cout << arr;
}