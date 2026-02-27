#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    int maxVal = 200;
    cout << "2 ";

    for (int i = 3; i <= maxVal; i += 2){
        double val = i;
        int test = static_cast<int>(sqrt(val));
        int j;

        for (j = 3; j <= test; j += 2){
            if (i % j == 0){
                break;
            }
        }
        if (j > test){
            cout << i << ' ';
        }
    }
    cout << endl;
}