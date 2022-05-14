#include<stdio.h>
#include<stdlib.h>

struct SList {
    int data;
    struct SList* next;
};

void erase(struct SList* n, int val) {
    struct SList* tmp1 = n;
    struct SList* tmp2 = n;
    for (int i = 0; i <= val - 2; i++) {
        tmp1 = tmp1->next;
    }
    for (int i = 0; i <= val - 2; i++) {
        tmp2 = tmp2->next;
    }
    tmp1->next = tmp2->next;
    tmp2->next = NULL;
}

int insert(struct SList* n) {
    struct SList* prev, * current, * next;
    current = n;
    prev = NULL;
    while (current != NULL) {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }
    n = prev;
    return n->data;
}

void insertPrint(struct SList* n) {
    struct SList* tmp = n;
    if (tmp == NULL) { return; }
    insertPrint(tmp->next);
    printf("%d", tmp->data);
}

void printl(struct SList* n) {
    while (n != NULL) {
        printf("%d", n->data);
        n = n->next;
    }
}

int main() {
    struct SList* head = NULL;
    struct SList* second = NULL;
    struct SList* third = NULL;
    struct SList* fourth = NULL;

    head = (struct SList*)malloc(sizeof(struct SList));
    second = (struct SList*)malloc(sizeof(struct SList));
    third = (struct SList*)malloc(sizeof(struct SList));
    fourth = (struct SList*)malloc(sizeof(struct SList));

    head->data = 1;
    head->next = second;

    second->data = 2;
    second->next = third;

    third->data = 3;
    third->next = fourth;

    fourth->data = 4;
    fourth->next = NULL;

    printl(head);
    printf("\n");
    insertPrint(head);

    return 0;
}