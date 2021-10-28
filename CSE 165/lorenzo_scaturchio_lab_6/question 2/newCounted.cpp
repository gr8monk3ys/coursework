#include <iostream>
#include <vector>
using namespace std;

class Counted {
    friend ostream& operator << (ostream& out, const Counted& o);
public:
    Counted() : id(count++) { cout << "Counted created id: " << id << endl; }
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
        i++;
    }

    cout << "Vector created elements: " << vectorCount.size() << endl;

    while(i < vectorCount.size()){
        cout << *vectorCount[i] << ' ';
    }


    while (vectorCount.size() > 0) {
        Counted* temp = v.back();
        v.pop_back();
        delete temp;
    }

    cout << "Vector destroyed elements" << endl;

    return 0;
}