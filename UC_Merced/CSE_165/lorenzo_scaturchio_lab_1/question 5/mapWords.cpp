#include <iostream>
#include <string>
#include <cstdio>
using namespace std;

int main() {
    string word;
    cout << "Enter a word/sentence: ";

    while (true) {
        int type;
        
        cin >> word;

        if (word == "exit") {
            break;
        }

        if (word == "the" ||  word == "an" || word == "a") {
            type = 0;
        }
        else if (word == "who" || word == "what" ||
            word == "when" || word == "where" ||
            word == "why") {
            type = 1;
        }
        else if (word == "before" || word == "after" || word == "beside" || word == "by" ||
        word == "for" || word == "from" || word == "in" || word == "into" ||
            word == "of" || word == "to") {
            type = 2;
        }
        else if (word == "if" || word == "else") {
            type = 3;
        }

        else {
            type = 4;
        }

        switch (type) {
        case 0:
            puts("article");
            break;
        case 1:
            puts("interrogative");
            break;
        case 2:
            puts("preposition");
            break;
        case 3:
            puts("conditional");
            break;
        default:
            puts("unmapped word");
            break;
        }
    }
    return 0;
}
