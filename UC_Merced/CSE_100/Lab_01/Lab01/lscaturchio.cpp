#include <iostream>
using namespace std;

// Setting global variables
int *sorted;
int n = 1;

//function declaration
void insertionSort(int arr[], int n);

int main(int argc, char **argv)
{

    // Get the size of the sorted
    cin >> n;
    sorted = new int[n];
    int arr[n];

    // Read the array
    for(int k = 1; k <= n; k++){
        cin >> arr[k];
    }
    
    // Iterating through each given array
    for (int j = 2; j <= n; j++)
    {
        int val = arr[j];
        int i = j - 1;

        while (i > 0 && arr[i] > val){
            // Checks to see if the values to the left are larger and switches
            arr[i + 1] = arr[i];
            i--;
        }
         arr[i + 1] = val;

        // store the value in the sorted array
        for(int l = 1; l <= j; l++){
            sorted[l] = arr[l];
            cout << sorted[l] << ";";
        }
        cout << "\n";
    }

    // Free allocated space
    delete[] sorted;

    return 0;
}