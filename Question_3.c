Question-3
Which line will show error and why?
#include<stdio.h>
int main(){
char *a = "India";
char b[] = "India";
a = a+1;//line 5
b = b+1;//line 6

Ans-The line that will show an error is line 6: b = b+1;.
This line will result in a compilation error because you cannot modify the base address of an array (b is an array). 

