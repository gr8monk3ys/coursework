#include <iostream>
#include <list>
#include <algorithm>
#include<array>
using namespace std;

int hashSize;
bool isRunning = true;
list<int> *hashTable;

int hashFunction(int m){
    return (m % hashSize);
}

void insert(int key){
    hashTable[hashFunction(key)].push_front(key);
}

void _delete(int key){
    list<int> hashKey = hashTable[hashFunction(key)];

    int i = 0;
    for(list<int>::const_iterator iter = hashKey.begin(), end = hashKey.end(); iter != end, ++iter){
        if(*iter == key){
            iter = hashKey.erase(i);
            cout << key << "DELETED\n";
        }
    }
    i++;
}

void search(int key){
    list<int> hashKey = hashTable[hashFunction(key)];

    int i = 0;
    for(list<int>::const_iterator iter = hashKey.begin(), end = hashKey.end(); iter != end, ++iter)
}

void output(){
    for(int i = 0; i < hashSize; i++){
        if()
    }
}

int main(){
    cin >> hashSize;
    hashTable = new list<int>[hashSize];

    while(isRunning == true){
        int key;
        char call;

        int i = 0;
        cin >> call;

        switch(call){
            case 'i':
                cin >> key;
                insert(key);
                break;
            case 'd':
                cin >> key;
                _delete(key);
                break;
            case 's':
                cin >> key;
                search(key);
                break;
            case 'o':
                output();
                break;
            case 'e':
                isRunning = false;
                break;
        }
    }

    return 0;
}