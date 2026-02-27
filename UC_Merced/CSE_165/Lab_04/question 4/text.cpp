#include <iostream>
#include <fstream>
#include <string>
using namespace std;

class Text {
    string text;
public:
    Text() {}
    Text(const string& fname) {
        ifstream ifs(fname.c_str());
        string line;
        while (getline(ifs, line)) {
            text += line + '\n';
        }
    }
    string contents() {
        return text;
    }
};

int main(int argc, char* argv[]) {
    if (argc > 1) {
        Text text1;
        Text text2(argv[1]);
        cout << "Text 1:\n" << text1.contents() << endl;
        cout << "Text 2:\n" << text2.contents() << endl;
    }
}
