#include <bits/stdc++.h>
using namespace std;

void print(vector<int> data)
{
    cout << "Total Elements: " << data.size() << "\n";
    for (int datam : data)
        cout << datam << " ";
    cout << "\n\n";
}

vector<int> input()
{
    vector<int> inputted_array;
    int data_size;
    int n;
    cin >> data_size;
    while (data_size)
    {
        cin >> n;
        inputted_array.push_back(n);
        data_size--;
    }
    return inputted_array;
}

vector<int> reverse(vector<int> inputted_data)
{
    vector<int> reversed_vect;
    while (!inputted_data.empty())
    {
        reversed_vect.push_back(inputted_data.back());
        inputted_data.pop_back();
    }
    return reversed_vect;
}

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    vector<int> inputted_data = input();
    print(inputted_data);
    inputted_data = reverse(inputted_data);
    print(inputted_data);
    return 0;
}