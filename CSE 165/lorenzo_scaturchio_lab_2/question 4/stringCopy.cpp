#include <iostream>
#include <cstring>
#include <cstddef>
using namespace std;

char* stringCopy(char* firstString) {
    size_t len = strlen(firstString);
    char* secondString = new char[len + 1];

    strcpy(secondString, firstString);

    return secondString;
}

int main() {
    char* firstString = "Hi there!";
    char* secondString = stringCopy(firstString);

    cout << "firstString: \"" << firstString << "\" at " << static_cast<void*>(firstString) << endl;
    cout << "secondString: \"" << secondString << "\" at " << static_cast<void*>(secondString) << endl;

    delete[] secondString; // to prevent segmentation fault
}