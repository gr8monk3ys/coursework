#include <stdio.h>
#include <string.h>

/*
    Return the result of appending the characters in s2 to s1.
    Assumption: enough space has been allocated for s1 to store the extra
    characters.
*/
char* append (char s1[ ], char s2[ ]) {
    int s1len = strlen (s1);
    int s2len = strlen (s2);
    int k;
    for (k=0; k < s1len; k++) {
        s1[k + s2len] = s2[k];
    }
    return s1;
}

int main ( ) {
    char str1[5];
    char str2[5];
    while (1) {
        printf ("str1 = ");
        if (!gets (str1)) {
            return 0;
        };
        printf ("str2 = ");
        if (!gets (str2)) {
            return 0;
        };
        printf ("The result of appending str2 to str1 is %s.\n", 
            append (str1, str2));
    }
    return 0;
}
