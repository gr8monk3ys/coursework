#include <iostream>
#include <string>
using namespace std;

typedef struct {
    string first;
    string last;
    int age;
} Person;

int main() {
    using namespace std;
    Person p;
    p.first = "Lorenzo";
    p.last = "Scaturchio";
    p.age = 21;
    cout << p.last << ', ' << p.first << ', ' << p.age << endl;

    Person* pptr = &p;
    pptr->first = "Travis";
    pptr->last = "Scott";
    pptr->age = 29;
    cout << pptr->last << ', ' << pptr->first << ', ' << pptr->age
        << endl;
}
