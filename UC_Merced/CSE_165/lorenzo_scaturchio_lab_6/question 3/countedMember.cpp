#include <iostream>
#include <vector>

using namespace std;

class Counted {
    friend ostream& operator << (ostream& out, const Counted& o);
public:
    Counted() : id(count++) { cout << "Counted created id: " << id << endl; }
    void f() { cout << "f() called id: " << id << endl; }
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
    vector<Counted*> vectorCount;
    int i = 0;
    while(i < 10){
        vectorCount.push_back(new Counted);
        cout << "Vector created elements: " << vectorCount.size() << endl;
        i++;
    }

    i = 0;
    while(i < vectorCount.size()){
        cout << *vectorCount[i];
        i++;
    }

    i = 0;
    while(i < vectorCount.size()){
        vectorCount[i]->f();
        i++;
    }

    while (vectorCount.size() > 0) {
        Counted* temp = vectorCount.back();
        vectorCount.pop_back();
        delete temp;
    }

    return 0;
}