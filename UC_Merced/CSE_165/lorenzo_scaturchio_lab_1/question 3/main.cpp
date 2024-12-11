#include <iostream>
#include "main.h"
using namespace std;

void funcOne(int i){
    cout << "f(" << i << ") returning void\n";
}

char funcTwo(float x){
    cout << "g(" << x << ") returning char\n";
    return 'e';
}

int funcThree(char c){
    cout << "h(" << c << ") returning int\n";
    return 420;
}

float funcFour(){
    cout << "k() returning float\n";
    return 4.20;
}
