#include <iostream>
using namespace std;

class Counted {
public:
    Counted() : id(count++) { cout << "Counted created id: " << id << endl; }
    ~Counted() { cout << "Counted deleted id: " << id << endl; }
private:
    int id;
    static int count;
};
int Counted::count = 0;

int main() {
    Counted* countPtr = new Counted;
    delete countPtr;
    return 0;
}