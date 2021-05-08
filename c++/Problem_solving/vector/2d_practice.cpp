#include <bits/stdc++.h>
using namespace std;

void print(vector<vector<int>> data, string text = "")
{
    cout << text << "\n";
    cout << "Total Row: " << data.size() << "\n";
    for (vector<int> row : data)
    {
        cout << "\t[" << row.size() << "]->";
        for (int column : row)
        {
            cout << column << " ";
        }
        cout << "\n";
    }
    cout << "\n";
}

int main()
{
    vector<vector<int>> vect;
    vector<int> row;
    row.push_back(2);
    row.push_back(3);
    vect.push_back(row);
    print(vect);
    return 0;
}