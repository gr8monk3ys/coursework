#include <iostream>
#include <sstream>
#include <new>
#include <string>
#include <vector>
#include <cstddef>
using namespace std;

class Placement {
    static vector<string> placeVec;
public:
    static void* operator new(size_t size, const char* file, int line);
    static void display();
};

vector<string> Placement::placeVec;

void* Placement::operator new(size_t size, const char* file, int line) {
    ostringstream os;
    os << file << ", line " << line;
    placeVec.push_back(os.str());
    return ::operator new(size);
}

void Placement::display() {
    size_t i = 0;
    while (i < placeVec.size()) {
        cout << placeVec[i] << endl;
        ++i;
    }
}

#define new new (__FILE__, __LINE__)

int main() {
    Placement* p1 = new Placement;
    Placement* p2 = new Placement;
    Placement* p3 = new Placement;
    Placement::display();
    delete p1;
    delete p2;
    delete p3;
}
