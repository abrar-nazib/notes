# Problem Solving Notes

## Basics

**For making iostream, vector, algorithm and other libraries available in the code.:**

```c++
#include <bits/stdc++.h>
using namespace std; // classes and functions of the standard library can be directly used inside code
```

**Getting input:**

```bash
a b c
```

```bash
a b
c
```

```c++
char aa, bb, cc;
std::cin >> aa >> bb >> cc; // aa='a', bb='b', cc='c'
```

```c++
ios::sync_with_stdio(0);
cin.tie(0);
// These two lines of code at the beginning of the program makes input and output more efficient
```

- `"\n"` works faster than `endl` because `std::endl` does a flush operation everytime used.
- `scanf` and `printf` are a bit faster but has complexity in their use case.

**Getting a full line input containing spaces:**

```c++
string s;
getline(cin, s); // from stdin, get one line and put it in string s
```

**Continuously get input:**

```c++
while (cin >> x){
    // do whatever needed to do with x
}
// This loop reads elements from the input one after another, until there is no more data available in the input.
```

**Reading from file:**

```c++
freopen("input.txt", "r", stdin);
```

## Working with numbers

- `long long` 64 bit variable

```c++
long long x = 123456789123456789LL;
```

## Helpful functions

```c++
swap(a,b); //swaps the values of a and b
min(a,b); //returns the lowest value between a and b
min({a,b,c,d,e,f,g}); //if more than two values to be compared, array should be passed as parameter
                    // but this one is a fucked up function, can't take pre declared array
array.size(); //returns array size
min_element(array, array+array_size); // does the job of comparing array and returns memory index
find(array, array+array_size, value_searching_for); //returns the pointer of the value, (- arr) returns the index, if returns array size, it's a fail case
binary_search(sorted_array, sorted_array+size, value_searching_for); // returns a boolean value
count(array, array+array_size, value_repeated) // returns the repetation in the array
sort(array, array+array_size); //sorts the array

```

## Vector[1D]

Vector could be called a dynamic array, memory doesn't need to be pre defined

### Vector creation

```c++
//vector<data_type> name (elements);
vector<int> vect_data (5) // equivalent to int data[5]; initially data size 5
vector<int> vect_data (5,2) // every element's initial value is 2
vector<int> vect_data ({1,2,3,4,5}) // vector with values
vector<int> vect_data = {1,2,3,4,5} // vector with values
vector<int> vect_data2 = vect_data // vector to vector value assignment
```

### Vector element Insertion

```c++
vect_data.size();   // Returns the element count of the vector
vect_data.push_back(value); // adds value at the end
vect_data.begin(); //beginning of the vector data array
vect_data.end(); //ending position of vector data
vect_data.insert(vect_data.begin(), value); //inserts value in the beginning
vect_data.insert(vect_data.begin(), n, value); //inserts n values in the beginning
vect_data.insert(vect_data.begin()+2, value); //inserts value in the [2] index from the beginning
vect_data.insert(vect_data.end(), value); //inserts value at the end
vect_data.insert(vect_data.end(), n, value); //inserts n values at the end
vect_data.insert(vect_data.end()-1, value); //inserts value at the [end-1] position

```

### Vector read/print

basic array printing style

```c++
vect_data[index];//returns the data in the index
vect_data.at(index); //returns the data in the index
vect_data.front(); //returns the first data
vect_data.back(); //returns the last data

for(int dd:vect_data){
    cout << dd;         //prints all elements in the vector
}
vect_data.data(); //returns the pointer of the first element of the vector
```

### Vector update

```c++
vect_data[x]=y //updated the data on the x index

vect_data.swap(vect_data2); //swaps vect data full vector with vector data 2
```

### Vector delete

```c++
vect_data.pop_back();//deletes the last element of the vector
vect_data.clear(); //deletes all the elements of the vector, makes the vector empty
vect_data.erase(vect_data.begin()+2, vect_data.begin()+3); //deletes the element at index 2
```

## Vector[2D]

```c++
vector<type> name; //is the base syntax
vector<int> data // data is an integer type vector -> vector containing integer type data
vector<vector <int>> data // data is a VECTOR type vector where VECTOR contains integer type data and vector contains vector type data
```

### Data Accessing in 2D vector

```c++
var[row][column];// scheme
```

### 2D vector creation

```c++
vector<vector<int>> data(row); //creates a vector with n(rows)
vector<vector<int>> data(row, vector<int>(column)); //creates a vector with n(rows) and each row will have a vector having n(column)
vector<vector<int>> data(row, vector<int>(column,default_value))//creates a vector with n(rows) and each row will have a vector having n(column) and each element's default value is default_value
vector<vector<int>> vect({{1,2},{2,3},{3,4}}) //base vector declaration

```

### Data Addition in 2D Vector

```c++
    vector<vector<int>> vect;
    vector<int> row;
    row.push_back(2);
    row.push_back(3);
    vect.push_back(row);//inserts 2, 3 in the first row
```
