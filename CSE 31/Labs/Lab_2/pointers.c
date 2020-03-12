#include <stdio.h>

int main(){
    int x, y, *px, *py = 0;
    int arr[10];

    print("%d", &x);
    print("%d", &y);

    px=&x;
    py=&y;
    print("%i", px);
    print("%i", px);

    int *ptr = &arr[0];
    for(int j = 0; j < 10; j++){
        printf("Arr[%d]: %d \n", j, *ptr++);
    }
    
    ptr = arr;
    printf("ptr = arr: %d \n", *ptr);

    return 0;
}