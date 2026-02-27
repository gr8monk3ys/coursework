// pseudo code

// input integer
// size = size + 1

// while number != 0:
//     input integer
//     size = size + 1

// for i less than size of array:
//     if arr val < 0:
//         positive avg += arr val
//     if arr val > 0:
//     negative avg += arr val

// if positive avg = 0:
//     print negative avg
// else if negative avg = 0:
//     print positive avg

#include <stdio.h>

int main(){

int num;
int size = 0;
int arr[size];
int posTot = 0, negTot = 0;
int posAvg = 0, negAvg = 0;

printf("Please enter an integer: ");
scanf("%i", &num);
arr[size] = num;
size++;

while(num != 0){

    printf("Please enter an integer: ");
    scanf("%i", &num);
    
    arr[size] = num;
    size++;
}

for(int i = 0; i < size; i++){
    if(arr[i] < 0){
        negAvg += arr[i];
        negTot++;
    } else if(arr[i] > 0){
        posAvg += arr[i];
        posTot++;
    }
}

if(posAvg == 0){
    negAvg /= negTot;
    printf("Negative average: %i\n", negAvg);
} else if(negAvg == 0){
    posAvg /= posTot;
    printf("Positive average: %i\n", posAvg);
} else{
    posAvg /= posTot;
    negAvg /= negTot;
    printf("Positive average: %i\n", posAvg);
    printf("Negative average: %i\n", negAvg);
}

return 0;
}