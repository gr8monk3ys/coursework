#include <iostream>
#include "pStash.h"
#include "pStash.cpp"
using namespace std;

class Counted {
friend ostream& operator<< (ostream& out, const Counted& o);
public:
    Counted() : id(count++) { cout << "Counted created id: " << id << endl; }
    void f()   { cout << "f() called id: " << id << endl; }
    ~Counted() { cout << "Counted destroyed id: " << id << endl; }
private:
    int id;
    static int count;
};

int Counted::count = 0;

ostream& operator<< (ostream& out, const Counted& o) {
    out << o.id;
    return out;
}

int main() {
    PStash countedStash;

    int i = 0;
    while(i < 10){
        countedStash.add(new Counted);
        i++;
    }

    cout << "Stash created, elements: " << countedStash.count() << endl;

    i = 0;
    while(i < countedStash.count()){
        cout << *((Counted* )countedStash[i]) << ' ';
        i++;
    }

    cout << endl;

    i = 0;
    while(i < countedStash.count()){
        ((Counted*)countedStash[i])->f();
        i++;
    }

    i = 0;
    while(i < countedStash.count()){
        delete (Counted* )countedStash.remove(i);
        i++;
    }

return 0;
}
