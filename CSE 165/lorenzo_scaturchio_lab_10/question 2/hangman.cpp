#include<iostream>
#include<string.h>
using namespcace std;

main() {
    char word[30], getit[30], * found;
    int score, loop, len, num, lup, om, luptimes, times, fitimes, ondtimes, antimes;
    luptimes = 0;
    fitimes = 0;
    ondtimes = 0;

    clrscr();
    cout << "\n ENTER THE WORD: ";
    cin << word << endl;

    score = 0;
    num = 0;
    om = 0;
    len = strlen(word);

    clrscr();

    char gname[70];
    cout << "\n ENTER YOUR NAME: ";
    cin << gname << endl;
    char h;
    cout << "LET's START: ";
    h = '_';
    cout << "\n LOOK HERE: " << endl;

    for (loop = 0;loop != len;loop++) {
        cout << h << endl;
    }

    for (loop = 0;loop != len;loop++) {
        om = 1;
        num = num + 1;
        fitimes = 0;
        ondtimes = 0;

        cout << "\n " << num << " LETTER";
        cin << &getit[num] << endl;
        found = strchr(word, getit[num]);
        if (found) {
            for (luptimes = 0;antimes = 1;luptimes != len;luptimes++, antimes++) {
                if (getit[num] == word[luptimes]) {
                    fitimes++;
                }
                else {
                    fitimes = fitimes;
                }
            }
            for (luptimes = num;luptimes != 0;luptimes--) {
                if (getit[num] == getit[luptimes]) {
                    ondtimes++;
                }
                else {
                    ondtimes = ondtimes;
                }
            }
            if (fitimes >= ondtimes) {
                score = score + 1;
                cout << "OK" << endl;
                for (lup = 0;getit[num] != word[lup];lup++) {
                    om++;
                }

                cout << "\n POSITION: " << om << endl;
                cout << "\n ===================" << endl;
            }else {
                score = score;
                cout << "\n NOT AGAIN!" << endl;
            }
        } else {
            score = score;
            cout << "\n NO" << endl;
        }
    }
    cout << "\n THE WORD IS "<< word << endl;
    cout << "\n YOUR SCORE IS " << score << " OUT OF " << len;
    getch();
    return 0;
}