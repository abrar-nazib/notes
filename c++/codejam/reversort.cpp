#include <iostream>
#include <cstring>
#include <stdio.h>

void reverse(int from, int to, int *A)
{
    int temp;
    for (from; from < to; from++, to--)
    {
        temp = A[from];
        A[from] = A[to];
        A[to] = temp;
    }
}

int j_findout(int *A, int i, int N)
{
    int x;
    for (x = 0; x <= N; x++)
    {
        if (A[x] == i + 1)
            return x;
    }
    return x;
}

int main()
{
    int T = 0;
    scanf("%d", &T);
    int N;
    int A[100];
    int B[100];
    int i, j;
    long cost;
    for (int t = 0; t < T; t++)
    {
        //scanning part of the Problem
        //--------------------------------------------------------------------
        //printf("Input no of element in array A: ");
        scanf("%d", &N);
        //printf("You entered: %d\n", N);
        //printf("Input array A elements in one line: ");
        for (int x = 0; x < N; x++)
        {
            fscanf(stdin, "%d", &A[x]);
        }
        // for (int xx = 0; xx < N; xx++)
        // {
        //     printf("%d ", A[xx]);
        // }

        //Cost generation part of the problem
        //--------------------------------------------------------------------
        cost = 0;
        for (int i = 0; i < N - 1; i++)
        {
            j = j_findout(A, i, N);
            cost = cost + (j - i + 1);
            reverse(i, j, A);
        }
        B[t] = cost;
        // for (int xx = 0; xx < N; xx++)
        // {
        //     printf(" %d ", A[xx]);
        // }
    }
    for (int ans = 0; ans < T; ans++)
    {
        printf("Case #%d: %d\n", ans + 1, B[ans]);
    }

    return 0;
}

/*
24
4 1 2 3 4
4 1 2 4 3
4 1 3 2 4
4 1 3 4 2
4 1 4 2 3
4 1 4 3 2
4 2 3 1 4
4 2 3 4 1
4 2 4 1 3
4 2 4 3 1
4 2 1 3 4
4 2 1 4 3
4 3 2 1 4
4 3 2 4 1
4 3 4 1 2
4 3 4 2 1
4 3 1 2 4
4 3 1 4 2
4 4 1 2 3
4 4 1 3 2
4 4 2 1 3
4 4 2 3 1
4 4 3 1 2
4 4 3 2 1

*/