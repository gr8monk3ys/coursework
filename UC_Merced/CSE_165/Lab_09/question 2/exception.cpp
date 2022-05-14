#include<iostream>
#include<stdexcept>
using namespace std;

class Person {
    string name;
    int age;
public:
    class Exception : public exception {
    public:
        const char* msg;
        Exception(const char* errMsg) {
            msg = errMsg;
        }
    };

    Person(string _name, int _age) throw(Exception) {
        name = _name;
        setAge(_age);
    }

    void setAge(int _age) throw(Exception) {
        if (_age <= 0) {
            throw Exception("Error: Age can't be negative / zero");
        }
        age = _age;
    }

    string getName() const {
        return name;
    }
    int getAge() const {
        return age;
    }
};

int main() {
    try {
        Person me("Lorenzo", 21);
        cout << "Name: " << me.getName() << ", " << "Age: " << me.getAge() << endl;
        cout << "Setting age to -2..." << endl;
        me.setAge(-2);
    }
    catch (Person::Exception ex) {
        cout << ex.msg << endl;
    }
    return 0;
}