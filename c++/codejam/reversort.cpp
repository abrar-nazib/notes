#include <iostream>
#include <cstring>
#include <stdio.h>
void scan_std();
int main()
{
    scan_std();
    return 0;
}

void scan_std()
{
    int N, A[N];
    printf("Input no of element in array A: ");
    scanf("%d", &N);
    printf("You entered: %d\n", N);
    printf("Input array A elements in one line: ");
    for (int i = 0; i < N; i++)
    {
        fscanf(stdin, "%d", &A[i]);
        printf("A[%d] is: %d\n", i, A[i]);
    }
}