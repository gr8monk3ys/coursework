#include <iostream>
#include <string>
#include <sstream>

using namespace std;

class Bird {
    friend ostream& operator<<(ostream& os, const Bird& obj);
public:
    Bird() {
        ostringstream ss;
        ss << "Bird #" << count++;
        name = ss.str();
        cout << name << ": Constructor" << endl;
        countObj();
    }

    Bird(const Bird& b2) {
        name = b2.name;
        count++;
        cout << name << ": Copy constructor" << endl;
        countObj();
    }

    ~Bird() {
        count--;
        cout << name << ": Destructor" << endl;
        countObj();
    }

    Bird& operator=(const Bird& right) {
        cout << name << ": Operator" << endl;

        if (this == &right) {
            return *this;
        }
        name = right.name;
        countObj();
    }

    void countObj() { cout << "Instanses: " << count << endl; }

private:
    string name;
    static int count;
};

int Bird::count = 0;

ostream& operator<<(ostream& os, const Bird& obj) {
    os << obj.name;
}

void someFunc(Bird b2) {}

int main() {

    Bird b1;
    Bird b2;
    Bird b3;

    cout << b1 << ", " << b2 << ", " << b3 << endl;
    b3 = b1;
    someFunc(b2);
    cout << b1 << ", " << b2 << ", " << b3 << endl;
    return 0;
}