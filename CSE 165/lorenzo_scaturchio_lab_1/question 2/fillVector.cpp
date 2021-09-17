#include <iostream>
#include <fstream>
#include <vector>
#include <string>
using namespace std;

int main(){
    ifstream in("text.txt");
    vector<string> text;
    
    string line;
    while (getline(in, line))
        text.push_back(line);

    string lines;
    for (int i = 0; i < text.size(); i++)
        lines += text[i] + "\n";
    cout << lines;
}
