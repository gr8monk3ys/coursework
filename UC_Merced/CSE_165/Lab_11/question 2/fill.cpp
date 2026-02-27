#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

vector<double> sineVals(vector<double> vec) {
    vector<double> result;

    int i = 0;
    while(i < vec.size()){
        result.push_back(sin(vec.at(i)));
        i++;
    }
    return result;
}

int main() {
    vector<double> vec;
    vec.push_back(1);
    vec.push_back(5);
    vec.push_back(10);
    vec.push_back(30);
    vec.push_back(50);

    vector<double> result = sineVals(vec);

    int i = 0;
    while(i < result.size()){
        cout << result.at(i) << endl;
        i++;
    }
    return 0;
}