#include <bits/stdc++.h>
using namespace std;

void print(vector<int> data)
{
    cout << "Total Elements: " << data.size() << "\n";
    for (int datam : data)
        cout << datam << " ";
    cout << "\n\n";
}

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    vector<int> vect_data({1, 2, 3, 4, 5});
    //cout << vect_data[3];
    int x[5] = {1, 2, 3, 4, 5};
    for (int l : x)
        cout << l;
    return 0;
}