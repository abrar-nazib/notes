// C++ program to display all permutations
// of an array using STL in C++

#include <bits/stdc++.h>

// Function to display the array
void display(int a[], int n)
{
    for (int i = 0; i < n; i++)
    {
        std::cout << a[i] << " ";
    }
    std::cout << std::endl;
}

// Function to find the permutations
void findPermutations(int a[], int n)
{ // Sort the given array
    std::sort(a, a + n);
    // Find all possible permutations
    std::cout << "Possible permutations are:\n";
    do
    {
        display(a, n);
    } while (std::next_permutation(a, a + n));
}

// Driver code
int main()
{

    int a[] = {10, 20, 30, 40, 50, 60, 70};

    int n = sizeof(a) / sizeof(a[0]);

    findPermutations(a, n);

    return 0;
}
