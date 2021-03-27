#include <iostream>
#include <cstring>
#include <stdio.h>
#include <bits/stdc++.h>

void create_array(int *comb_array, int arr_size, int given_cost)
{
    for (int i = 0; i < arr_size; i++)
    {
        comb_array[i] = i + 1;
    }
    //----------------create_array----------------
}

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

int calculate_cost(int *A, int array_size)
{
    int j;
    int temp_arr[100];
    for (int x = 0; x < array_size; x++)
    {
        temp_arr[x] = A[x];
    }
    int cost = 0;
    for (int i = 0; i < array_size - 1; i++)
    {
        j = j_findout(temp_arr, i, array_size);
        cost = cost + (j - i + 1);
        reverse(i, j, temp_arr);
    }
    //std::cout << cost << std::endl;
    return cost;
}

void display(int a[], int n)
{
    for (int i = 0; i < n; i++)
    {
        std::cout << a[i] << " ";
    }
    std::cout << calculate_cost(a, n) << std::endl;
}

void findPermutations(int a[], int n, int given_cost)
{
    int cost;
    // Sort the given array
    std::sort(a, a + n);
    // Find all possible permutations
    // std::cout << "Possible permutations are:\n";
    do
    {
        cost = calculate_cost(a, n);
        // std::cout << cost << " " << given_cost << std::endl;
        if (cost == given_cost)
        {
            //std::cout << given_cost << " " << cost << std::endl;

            break;
        }
    } while (std::next_permutation(a, a + n));
}
bool possibility_judgement(int arr_size, int given_cost)
{
    int highest_value = 0;
    int lowest_value = arr_size - 1;
    for (int i = arr_size; i > 1; i--)
    {
        highest_value += i;
    }
    if (given_cost > highest_value || given_cost < lowest_value)
    {
        return false;
    }
    else
    {
        return true;
    }
}

int main()
{
    int arr_size, given_cost;
    int comb_array[100];
    int cost = 0;
    int T;
    scanf("%d", &T);

    for (int t = 0; t < T; t++)
    {
        scanf("%d %d", &arr_size, &given_cost);
        if (possibility_judgement(arr_size, given_cost))
        {
            create_array(comb_array, arr_size, given_cost);
            findPermutations(comb_array, arr_size, given_cost);
            printf("Case #%d: ", t + 1);
            for (int xx = 0; xx < arr_size; xx++)
            {
                printf("%d ", comb_array[xx]);
            }
            printf("\n");
        }
        else
        {
            printf("Case #%d: IMPOSSIBLE", t + 1);
        }
    }
    // int T = 0;
    // scanf("%d", &T);
    // int N;
    // int A[100];
    // int B[100];
    // int i, j;
    // long cost;
    // for (int t = 0; t < T; t++)
    // {
    //     //scanning part of the Problem
    //     //--------------------------------------------------------------------
    //     //printf("Input no of element in array A: ");
    //     scanf("%d", &N);
    //     //printf("You entered: %d\n", N);
    //     //printf("Input array A elements in one line: ");
    //     for (int x = 0; x < N; x++)
    //     {
    //         fscanf(stdin, "%d", &A[x]);
    //     }
    //     // for (int xx = 0; xx < N; xx++)
    //     // {
    //     //     printf("%d ", A[xx]);
    //     // }

    //     //Cost generation part of the problem
    //     //--------------------------------------------------------------------

    //     // for (int xx = 0; xx < N; xx++)
    //     // {
    //     //     printf(" %d ", A[xx]);
    //     // }
    // }
    // for (int ans = 0; ans < T; ans++)
    // {
    //     printf("Case #%d: %d\n", ans + 1, B[ans]);
    // }

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

6
3 1 2 3
3 1 3 2
3 2 1 3
3 2 3 1
3 3 1 2
3 3 2 1

*/