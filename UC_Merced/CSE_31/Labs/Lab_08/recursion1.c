
#include<stdio.h>

int recursion(int m){
    if(m == 10)
        return 2;
    else if(m == 11)
        return 1;
    else
        return recursion(m + 2) + m + recursion(m + 1);
}

int main(){
    int x;
    printf("Please enter an integer: ");
	scanf("%d", &x);
    printf("%d\n", recursion(x));
    return 0;
}
