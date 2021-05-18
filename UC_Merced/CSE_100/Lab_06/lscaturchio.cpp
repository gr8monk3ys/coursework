#include <iostream>
#include <list>
using namespace std;

bool isRunning = true;
int hashSize;
list<int> *hashTable;

int hashFunction(int m)
{
    return m % hashSize;
}

void insert(int key)
{
    hashTable[hashFunction(key)].push_front(key);
}

void _delete(int key)
{
    auto iter = hashTable[hashFunction(key)].begin();
    auto end = hashTable[hashFunction(key)].end();

    int i = 0;

    while (iter != end)
    {
        if (*iter == key)
        {
            iter = hashTable[hashFunction(key)].erase(iter);
            cout << key << ":DELETED"
                 << ";"
                 << "\n";
            return;
        }
        i++;
        ++iter;
    }
    cout << key << ":DELETE_FAILED"
         << ";"
         << "\n";
}

void search(int key)
{

    auto iter = hashTable[hashFunction(key)].begin();
    auto end = hashTable[hashFunction(key)].end();

    int i = 0;

    while (iter != end)
    {
        if (*iter == key)
        {
            cout << key << ":FOUND_AT" << hashFunction(key) << "," << i << ";"
                 << "\n";
            return;
        }
        i++;
        ++iter;
    }
    cout << key << ":NOT_FOUND"
         << ";"
         << "\n";
}

void output()
{
    for (int i = 0; i < hashSize; i++)
    {
        int listi = 0;
        cout << i << ":";

        auto tableVal = hashTable[i];
        auto iter = hashTable[i].begin();
        auto end = hashTable[i].end();

        while (iter != end)
        {
            listi++;
            hashTable[i].size() + 1 == listi ? cout << *iter : cout << *iter << "->";
            ++iter;
        }
        cout << ";"
             << "\n";
    }
}

int main()
{

    cin >> hashSize;
    hashTable = new list<int>[hashSize];
    char call;

    while (isRunning == true)
    {
        int key;
        cin >> call;

        if (call == 'i')
        {
            cin >> key;
            insert(key);
        }
        else if (call == 'd')
        {
            cin >> key;
            _delete(key);
        }
        else if (call == 's')
        {
            cin >> key;
            search(key);
        }
        else if (call == 'o')
        {
            output();
        }
        else if (call == 'e')
        {
            isRunning = false;
            exit(0);
        }
    }
    return 0;
}