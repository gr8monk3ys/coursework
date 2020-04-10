#include<stdio.h>

int recursion(int m){
    if(m == -1)
        return 1;
    else if(m == 0)
        return 3;
    else
        return recursion(m - 2) + recursion(m - 1);
}

int main(){
    int x;
    printf("Please enter an integer: ");
	scanf("%d", &x);
    printf("%d\n", recursion(x));
    return 0;
}
