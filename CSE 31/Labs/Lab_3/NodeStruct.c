#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

struct Node {
    int iValue;
    float fValue ;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;
	
	// Address of head
    printf("Address of head: %p\n", &head);
    // Value of head
    printf("Value of head (int): %d\n", head->iValue);
    printf("Value of head (double): %f\n", head->fValue);
    // Addresses of ivalue
    printf("Addresses of ivalue: %p\n", &head->iValue);
    // Addresses of fvalue
    printf("Addresses of fvalue: %p\n", &head->fValue);
    // next pointed by head
    printf("Next pointed by head: %p\n", head->next);
	
	
	return 0;
}