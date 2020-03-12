#include <iostream>
#include <bits/stdc++.h>
using namespace std;

// setting up global variables
int *arr;
int n = 0;

// instantiation of function
int maxSubCrossArr(int* A, int low, int mid, int high);
int maxSubArr(int* A, int low, int high);

int main(){
    // Get the size of the sequence
    cin >> n;
    arr = new int[n];
    int A[n];

    // Read full sequence
    for (int i = 0; i < n; i++){
        cin >> A[i];
    }  

    // Calling the function from the array size
    cout << maxSubArr(A, 0, n - 1);

    return 0;

    // Free allocated space
    delete[] arr;
}

int maxSubCrossArr(int* A, int low, int mid, int high){

    // Finding the sum of the left section
    // int leftSum = -214748364;
    int leftSum = 0; 
    int leftMax = 0;
    int sum = 0;
    for(int i = mid; i >= low; i--){
        sum += A[i];
        if(sum > leftSum){
            leftSum = sum;
            leftMax = i;
        }
    }

    // Finding the sum of the right section
    // int rightSum = -2147483647;
    int rightSum = 0;
    int rightMax = 0;
    sum = 0;
    for(int j = mid + 1; j <= high; j++){
        sum += A[j];
        if(sum > rightSum){
            rightSum = sum;
            rightMax = j;
        }
    }

    return(leftSum + rightSum);
}

int maxSubArr(int* A, int low, int high){
    // Base case
    if (low == high){
        return(A[low]);
    } else {
        // Divide and conquer
        int mid = (low + high) / 2;
        int leftSum = maxSubArr(A, low, mid);
        int rightSum = maxSubArr(A, mid + 1, high);
        int crossSum = maxSubCrossArr(A, low, mid, high);
        
        if(leftSum >= rightSum && leftSum >= crossSum){
            return(leftSum);
        } else if(rightSum >= leftSum && rightSum >= crossSum){
            return(rightSum);
        } else {
            return(crossSum);
        }

    }
}