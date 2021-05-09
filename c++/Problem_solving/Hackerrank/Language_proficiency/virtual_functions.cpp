#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;
//----------------------------------------------------------------------------------------
/*Person
    name, age
Professor
    publications, cur_id;
    getdata(), putdata();
Student
    marks[6], cur_id;
    getdata(),putdata();
*/

class Person
{
public:
    string name;
    int age;
    virtual void getdata(){};
    virtual void putdata(){};
};
class Professor : public Person
{
public:
    int publications;
    static int pr_cid;
    int cur_id = pr_cid;
    Professor()
    {
        pr_cid++;
    }
    void getdata()
    {
        cin >> name >> age >> publications;
    }
    void putdata()
    {
        cout << name << " " << age << " " << publications << " " << cur_id << "\n";
    }
};
class Student : public Person
{
public:
    int marks = 0;
    int xx;
    static int st_cid;
    int cur_id = st_cid;
    Student()
    {
        st_cid++;
    }
    void getdata()
    {
        cin >> name >> age;
        for (int i = 0; i < 6; i++)
        {
            cin >> xx;
            marks += xx;
        }
    }
    void putdata()
    {
        cout << name << " " << age << " " << marks << " " << cur_id << "\n";
    }
};
int Student::st_cid = 1;
int Professor::pr_cid = 1;
//----------------------------------------------------------------------------------------
int main()
{

    int n, val;
    cin >> n; //The number of objects that is going to be created.
    Person *per[n];

    for (int i = 0; i < n; i++)
    {

        cin >> val;
        if (val == 1)
        {
            // If val is 1 current object is of type Professor
            per[i] = new Professor;
        }
        else
            per[i] = new Student; // Else the current object is of type Student

        per[i]->getdata(); // Get the data from the user.
    }

    for (int i = 0; i < n; i++)
        per[i]->putdata(); // Print the required output for each object.

    return 0;
}
