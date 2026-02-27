#include <iostream>
using namespace std;

class You;

class Me {
public:
    void ProcessYou(You* p) {
        cout << "Processing You at " << p << endl;
    }
};

class You {
public:
    void ProcessMe(Me* p) {
        cout << "Processing Me at " << p << endl;
    }
};

int main() {
    Me me;
    You you;

    me.ProcessYou(&you);
    you.ProcessMe(&me);
}
