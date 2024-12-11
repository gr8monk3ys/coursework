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
        operator<<(ostream& ostream, const Arr<type, num>& vec) {
        int i = 0;
        while (i < num) {
            ostream << vec.arr[i];
            if (i != num - 1) {
                ostream << ", ";
            }
            i++;
        }
        ostream << endl;
        return ostream;
    }

    friend istream&
        operator>>(istream& istream, Arr<type, num>& vec) {
            int i = 0;
            while(i < num){
                istream >> vec.arr[i];
                i++;
            }
            istream >> vec.arr[i];
        return istream;
    }
};

int main() {
    stringstream input("3 1 4 1 5");
    Arr<int, 5> arr;
    input >> arr;
    arr[4] = -1;
    cout << arr;
}