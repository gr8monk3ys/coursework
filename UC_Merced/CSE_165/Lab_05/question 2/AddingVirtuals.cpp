#include <iostream>
#include <string>
using namespace std;

class Pet {
    string pname;

public:
    Pet(const string& petName) : pname(petName) {}
    virtual string name() const {
        return pname;
    }
    
    virtual string sit() const = 0;
    virtual string speak() const = 0;
};

class Dog : public Pet {
    string name;
public:
    Dog(const string& petName) : Pet(petName) {}
    virtual string sit() const {
        return Pet::name() + " sits";
    }
    virtual string speak() const {
        return Pet::name() + " says 'Bark!'";
    }
};

int main() {
    Pet* p[] = {new Dog("Poodle"),new Dog("Bob Dylan")};
    cout << "p[0]->speak() = " << p[0]->speak() << endl;
    cout << "p[1]->speak() = " << p[1]->speak() << endl;
    cout << "p[1]->sit() = " << p[1]->sit() << endl;
}
