Question-2
How to pass an array using call by value in C ? Assuming array is declared locally that is inside main() ?
Ans-In C, arrays are typically passed by reference, meaning that when you pass an array to a function, you're passing a pointer to the first element of the array. This allows functions to modify the original array directly.
However, if you want to simulate passing an array by value (i.e., you want to pass a copy of the array to the function), you can achieve this by copying the contents of the array into another array within the function. Here's how you can do it:
#include <stdio.h>
void manipulateArray(int arr[], int size) {
    int copy[size];
    for (int i = 0; i < size; i++) {
        copy[i] = arr[i];
    }

  
    for (int i = 0; i < size; i++) {
        copy[i] *= 2;
    }

printf("Manipulated Array: ");
    for (int i = 0; i < size; i++) {
printf("%d ", copy[i]);
    }
printf("\n");
}

int main() {
    int array[] = {1, 2, 3, 4, 5};
    int size = sizeof(array) / sizeof(array[0]);

manipulateArray(array, size);

printf("Original Array: ");
    for (int i = 0; i < size; i++) {
printf("%d ", array[i]);
    }
printf("\n");

    return 0;
}


