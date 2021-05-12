#include <iostream>
using namespace std;
enum class Fruit
{
    apple,
    orange,
    pear
};
enum class Color
{
    red,
    green,
    orange
};
template <typename T>
struct Traits;
Traits
{
    Color, Fruit
    // Color c = Color::red;
    // switch (c)
    // {
    // case Color::red:
    //     cout << "red" << endl;
    //     break;
    // case Color::green:
    //     cout << "green" << endl;
    //     break;
    // case Color::orange:
    //     cout << "orange" << endl;
    //     break;
    // case Fruit::apple:
    //     cout << "apple" << endl;
    //     break;
    // case Fruit::orange:
    //     cout << "orange" << endl;
    //     break;
    // case Color::pear:
    //     cout << "pear" << endl;
    //     break;
    // default:
    //     cout << "unknown" << endl;
    //     break;
    // }
}

int main()
{
    int t = 0;
    cin >> t;

    for (int i = 0; i != t; ++i)
    {
        int index1;
        cin >> index1;
        int index2;
        cin >> index2;
        cout << Traits<Color>::name(index1) << " ";
        cout << Traits<Fruit>::name(index2) << "\n";
    }

    return 0;
}
