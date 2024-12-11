#include <stdio.h>

int main() {
	int i;
	int four_ints[4];
	char* four_c;

	for(i=0; i<4; i++)
        four_ints[i] = 2;

	printf("%x\n", four_ints[0]);
	printf("%x\n", four_ints[1]);
	printf("\n");
	
    four_c = (char*)four_ints;

	for(i=0; i<4; i++)
        four_c[i] = 'A'; // ASCII value of 'A' is 65 or 0x41 in Hex.
    
    // Add your code for the exercises here:
	i = 0;
	while(i < 4){
		// Iterates every four bytes since it's an int
		printf("four_ints[%d] address: %d\n", i, abs(&four_ints[i]));
		printf("four_ints[%d] value: %x\n", i, four_ints[i]);
		i++;
	}
	printf("\n");
	i = 0;
	while(i < 4){
		// Iterates every byte since it's a char
		printf("four_c[%d] address: %d\n", i, abs(&four_c[i]));
		printf("four_c[%d] value: %x\n", i, four_c[i]);
		printf("\n");
		i++;
	}

	return 0;
}