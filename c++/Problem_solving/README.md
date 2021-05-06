# Problem Solving Notes

## Helpful functions

```c++
swap(a,b); //swaps the values of a and b
min(a,b); //returns the lowest value between a and b
min({a,b,c,d,e,f,g}); //if more than two values to be compared, array should be passed as parameter
                    // but this one is a fucked up function, can't take pre declared array
min_element(array, array+array_size); // does the job of comparing array and returns memory index
find(array, array+array_size, value_searching_for); //returns the pointer of the value, (- arr) returns the index, if returns array size, it's a fail case
binary_search(sorted_array, sorted_array+size, value_searching_for); // returns a boolean value
count(array, array+array_size, value_repeated) // returns the repetation in the array
sort(array, array+array_size); //sorts the array
             
```

## Vector

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

### Vector update

### Vector delete