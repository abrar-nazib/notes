#include <iostream>
using namespace std;
void swap(int &x, int &y)
{
    int temp;
    temp = x;
    x = y;
    y = temp;
}
int main()
{
    int a, b;
    a = 20;
    b = 10;
    int &ax = a;
    int &bx = b;
    swap(ax, bx);
    cout << a << " " << b << endl;
    return 0;
}