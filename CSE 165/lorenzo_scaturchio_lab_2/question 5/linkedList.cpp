#include <iostream>
using namespace std;

struct Struct {
    int val = 0;
    Struct* np = nullptr;
};

// void makeLinkedList(Struct* sp, int len);
// void printList(Struct* sp);

void makeLinkedList(Struct* sp, int len) {
    Struct* tp = sp;

    int i = 1;
    while (i <= len) {
        Struct* newStruct = new Struct;
        newStruct->val = i;
        newStruct->np = nullptr;
        tp->np = newStruct;
        tp = newStruct;
        i++;
    }
}

void printList(Struct* sp) {
    Struct* tp = sp;

    while (tp != nullptr) {
        cout << tp << ": " << tp->val << endl;
        tp = tp->np;
    }
    Struct* dp;
    tp = sp;

    while (tp != nullptr) {
        dp = tp;
        tp = tp->np;
        cout << "Deleting " << dp << ": " << dp->val << endl;
        delete dp;
    }
}

int main() {
    Struct s;
    cout << "Initial address: " << &s << endl;
    makeLinkedList(&s, 10);
    printList(&s);
}

