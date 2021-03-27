#include <iostream>
#include <cstring>
#include <stdio.h>

int main()
{
    int T = 0;
    scanf("%d", &T);
    for (int t = 0; t < T; t++)
    {
        //scanning part of the Problem
        int N;
        printf("Input no of element in array A: ");
        scanf("%d", &N);
        int A[N];
        printf("You entered: %d\n", N);
        printf("Input array A elements in one line: ");
        for (int i = 0; i < N; i++)
        {
            fscanf(stdin, "%d", &A[i]);
        }
        for (int xx = 0; xx < N; xx++)
        {
            printf("A[%d] is: %d\n", xx, A[xx]);
        }
    }

    return 0;
}
