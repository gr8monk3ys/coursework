#include<iostream>
using namespace std;

int main() {
    string str = "data\r more_\rdata";
    int str_size = str.size();
    int i = 0;

    while (i < str_size) {
        if (str[i] == 0x0d) {
            str.erase(str.begin() + i);
            str_size--;
        }
        i++;
    }
    cout << "Deleted 0x0d: " << str << "\n";
    return 0;
}