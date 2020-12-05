#include <stdio.h>
#include <stdlib.h>

int main(){

    // Main variables
    int numTimes;
    int typo;

printf("Enter the number of lines for the punishment: ");
scanf("%i", &numTimes);

if( numTimes < 0){
    printf("You entered an incorrect value for the number of lines!");
    exit(0);
}

printf("Enter the line for which we want to makea typo: ");
scanf("%i", &typo);

if( typo < 0 || typo > numTimes){
    printf("You entered an incorrect value for the line typo!");
    exit(0);
}

for (int i = 0; i < numTimes; i++) {
    if(i == (typo - 1)){
        printf("C programing languag is the besst! ");
    }
   printf("C programming language is the best! ");
}

return 0;
}