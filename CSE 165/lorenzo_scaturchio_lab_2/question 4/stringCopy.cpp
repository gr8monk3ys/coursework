#include <iostream>
#include <cstring>
#include <cstddef>
using namespace std;

char* copy(char* s1) {
    size_t len = strlen(s1);
    char* s2 = new char[len + 1];
    strcpy(s2, s1);
    return s2;
}

int main() {
    char* first = "Read my lips";
    char* second = copy(first);
    cout << "first == \"" << first << "\" at "
        << static_cast<void*>(first) << endl;
    cout << "second == \"" << second << "\" at "
        << static_cast<void*>(second) << endl;
    delete[] second;
}