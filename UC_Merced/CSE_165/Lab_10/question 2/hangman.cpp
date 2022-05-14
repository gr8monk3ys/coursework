#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdlib>
#include <ctime>
using namespace std;

const int GUESS_LIMIT = 5;
bool checkGuess(string word, char guess, bool match[]) {
    int flag = 0;
    int i = 0;
    while (i < word.length()) {
        if (word[i] == guess && match[i] == false) {
            match[i] = true;
            flag = 1;
        }
        i++;
    }
    if (flag == 1) {
        return true;
    }
    else {
        return false;
    }
}
void showGame(string word, bool match[], int numGuesses) {
    cout << "\tGuesses Remaining :" << GUESS_LIMIT - numGuesses << endl;
    cout << "\tWord: ";

    int i = 0;
    while (i < word.length()) {
        match[i] == false ? cout << "-" : cout << word[i];
        i++;
    }

    int count = 0;
    i = 0;
    while (i < word.length()) {
        if (match[i] == true) { count++; }
        i++;
    }

    if (count == word.length()) {
        cout << "\nYou Win" << endl;
        exit(0);
    }
}

int main() {
    int numGuesses = 0;
    string word;
    srand(time(NULL));
    const int LIST = 20;
    ifstream dataIn;
    dataIn.open("words.txt");
    string words[LIST];

    int i = 0;
    while (i < LIST) {
        dataIn >> word;
        words[i] = word;
        i++;
    }
    dataIn.close();

    int n = rand() % (LIST - 1) + 1;

    word = words[n];

    bool match[word.length()];
    char guess;

    int j = 0;
    while (j < word.length()) {
        match[j] = false;
        j++;
    }

    cout << "Hangman" << endl;

    do {
        showGame(word, match, numGuesses);
        cout << "\n\tChoose letter:";
        cin >> guess;
        cin.clear();
        cout << endl;
        if (!checkGuess(word, guess, match))
            numGuesses++;
    } while (numGuesses < GUESS_LIMIT);
    cout << "You lose the word was: " << word << endl;
    return 0;
}
