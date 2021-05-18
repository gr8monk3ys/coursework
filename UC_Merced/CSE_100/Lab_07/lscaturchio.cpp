#include <iostream>
using namespace std;

int rodLength;
int miniLengths;

int max(int a, int b) { 
    return (a > b)? a : b;
    } 

int* optimalCut(int* price, int* revenue){

    int val[rodLength + 1];
    int lastRod[rodLength + 1];
    int optimal = -1;
    
    val[0] = 0;

    for(int i = 0; i <= rodLength; i++){
        
        int maxVal = INT16_MIN;


        for(int j = 0; j < i; j++){
            int maxAlternate = max(maxVal, price[j] + val[i - j - 1]);
            if(maxVal < maxAlternate){
                maxVal = maxAlternate;
                optimal = j;
            }
            val[i] = maxVal;
            lastRod[i] = optimal + 1;
        }
    }

    cout << val[rodLength];
    int m = 0;
    
    for(int k = rodLength; k > 0; k -= lastRod[k]){
        revenue[m++] = lastRod[k];
    }

    miniLengths = m;
    cout << "\n" << revenue[0];

    for(int n = 1; n <= miniLengths; n++){
        revenue[n] == 0 ? cout << " -1": cout << " " << revenue[n]; 
    }
    
    cout << "\n";
}

int main(){
    cin >> rodLength;
    int* rod_price = new int[rodLength];
    int* revenue = new int[rodLength + 1]; 

    for (int i = 0; i < rodLength; i++) {
        cin >> rod_price[i];
    }

    int* lastRod = optimalCut(rod_price, revenue);

    return 0;
}