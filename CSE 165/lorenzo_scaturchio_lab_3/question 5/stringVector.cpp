#include <iostream>
#include <vector>
#include <string>
#include <cstddef>
using namespace std;

class StringVector : public vector<void*> {
public:
    void push_back(string* s) {
        vector<void*>::push_back(s);
    }
    string* operator[](size_t n) {
        return reinterpret_cast<string*>
            (vector<void*>::operator[](n));
    }
    const string* operator[](size_t n) const {
        return reinterpret_cast<const string*>
            (vector<void*>::operator[](n));
    }
};

int main() {
    StringVector stringVector;
    string string1("Hi"), string2("there"), string3("my"), string4("friend");

    stringVector.push_back(&string1);
    stringVector.push_back(&string2);
    stringVector.push_back(&string3);
    stringVector.push_back(&string4);

    size_t i = 0;
    while (i < stringVector.size()) {
        cout << *stringVector[i] << endl;
        ++i;
    }
}