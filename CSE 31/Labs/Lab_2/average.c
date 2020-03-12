#include <stdio.h>

/*
    Read a set of values from the user.
    Store the sum in the sum variable and return the number of values read.
*/

int read_values(double average) {
  int values = 0;
  int input = 0;
  double sum = 0;
  printf("Enter input values (enter 0 to finish):\n");
  scanf("%d", &input);
  while(input != 0) {
    values++;
    sum += input;
    scanf("%d", &input);
  }
  average = sum/values;
  return average;
}

int main() {
  double average = 0;
  average = read_values(average);
  printf("Average: %g\n", average);
  return 0;
}

