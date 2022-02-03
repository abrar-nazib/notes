# Notes on c++

---

## Visual Studio Settings

### Keyboard Shortcuts

- ctrl f7 -> Individual file compilation
- f5 -> Build and run Project
- f9 -> creates a breakpoint on the line(cursor's line)

### Configuration settings

- All configurations <-> All platforms
  - Output directory : $(SolutionDir)bin\$(Platform)\$(Configuration)\
    - Intermediate directory: $(SolutionDir)bin\intermediates\$(Platform)\$(Configuration)\
- C++ -> Optimization -> maximize speed //not necessary

-

## Compilation Process

every translation unit gets compiled into an object file.

## Linking Process

## Debugging

- Breakpoints

  - f9 puts a breakpoint in the cursor's line in VS.
    - Step over button(f10) lets go over another line.
    - step into button lets lookup into function code upon call
    - continue button runs the program until it hits the next break point

- Memory Lookup
  - Debug > Windows > Memory for memory view `&variablename` shows the variable in the memory

## Pointers

- pointers are actually integers storing memory addresses

## Referencing

- disguised pointers

## Enums

enumeratin -> Practically it is just is an integer
by default, But type could be cast.

```C++
enum Enumeration : unsigned int{
    var1 = 1, var2 ,var3, var4
};
```

## Arrays and Multi Dimensional Arrays

An array is really just a pointer to a memory address\
Can create some serius problem if tried to access index out of the scope of the array length
Array indexing in memory -> 0 index: don't add anything with the memory address\
 -> n index: add (n \* size_of_variable_type) with the memory address
Multi dimensional arrays are arrays of arrays\
Basic syntax:\

```c++

int arr[n]; //stack array -> gets destroyed with the scope(when hits the curly brace)
int* arr = new int[n]; //heap array -> have to destroy with delete[] arr keyword
#include <array> //for c++ 11 arrays
std::array<int, 5> array_name; //array.size() makes life good :)
//two dimentional arrays
int arr[m][n]; //creating m 1 dimentional arrays having n elements
               // arr returns a pointer for 1 dimentional array having n elements
int arr[0];    // is an array having n elements
int *(ptr)[3] = arr; //ptr points to a one dimentional array of three elements
                    // pointer type is array of three elements
```

array element retreival technique `sizeof(array) / sizeof(data_type)` sizeof() returns memory allocation of the variable\
but can only be retreived from stack arrays. not heap arrays are available in this method

## Strings

string declaration returns a char pointer.

```c++
const char* string_name = "staring";
char* srting_name = "string"; //doesn't work in my pc :| -> gets stored as constant cannot change any character
char string_name[] = "string";
#include <string> //for c++ standard library -> will be using this one
std::string string_name = "string value "; //creates a const char pointer. can change elements
```

const is used because strings are basically fixed allocated memory like arrays
Null Termination character : determines where the string ends 0x00 for 1 or multiple bytes (ascii value 0)

### About std::string s

by calling std::string string_name I might be calling instanciating an object from a string class\
iostream header file does have a definition for strings though it can no cout strings if string header is not included(reason not clear yet)\
using string class -> some methods can be accessed as well\
Appending strings: `std::string string = "nazib" + "abrar";` doesn't work cz can not add const char arrays. cannot glue two pointers together\
not sure what is happening here(class overloading)

```c++
 std::string string_name;
 string_name += "string_extension";
 std::string string_name = std::string("prefix") + "const char";
```

copying an array means dynamically allocating memory to heap to store that same string
passing strings in functions:

```c++
void function(const std::string& string){
  //did this because don't want to copy the string in the memory again cz string copy is quite slow
  // the & represents that got referenced (we are sending the reference of that string)
}
```

## String Literals

Bug of strlen() function: it counts till the \0(null termination character)
String literals are stored in read only areas of memory

```c++
const char* name = u8"Abrar";
const wchar_t* name = L"Abrar";
const char16_t name = u"Abrar";
const char32_t name = U"Abrar";

```

## Const keyword

```c++
const int* a = 00; //or
int const* a = 00; //here the contents of the variable can not be changed but could be referenced to some other pointer
          //like int* aa = 22;
          //     a = (int*) &aa; is a valid operation
          // but *a = 22; is not a valid operation
int* const a = 00; //here the pointer cannot be reassigned
const int* const a = 11; //none of them can be modified

```

- Const keyword in Class methods

```c++

int GetX() const
{
  //this class method can not modify any class variables
  //getter methods should be implemented with such syntaxes
}
//something interesting here
const int* const function() const{
  //if the varialbles were pointers -> safety measures
}

```

## Dynamic memory allocations

These functions allocate memory in heap
c functions : malloc, calloc, realloc, free

```c++
void* malloc(size_t size); //definition of malloc -> size_t is byte size and takes unsigned integer
//returns a void pointer -> address of the first byte of the memory block allocated
//need to typecast a void pointer to store data
int* p = (int*) malloc(3 * sizeof(int));

void* calloc(size_t num, size_t size); // eases the use of malloc -> do not need to multiply
//malloc does not assign any value to the memory blocks but calloc fills all the blocks with 0;
int* p = (int*) calloc(3, sizeof(int));

void* realloc(void* ptr, size_t size); //reallocates the memory previously allocated by malloc

free(memory_address); // fills the memory block with garbage values

int* b = (int*) realloc(memory_address, new_size); //extends the memory block with new_size -> if available, extends
//if not available, copies all the values in new address and removes the previous block

```

## Function Pointers

General pointers that can store address of functions. Could be used to dereference and execute a function\
Instructions are stored in code section of the memory allocated to the program\
Function pointers point to the memory address of the first instruction of the function. Assembly jump equivalent thing\

```c++
int Add(int a, int b){}

int (*p)(int, int); //declaration of a function pointer having two parameters
p = &Add; // or p = Add would also be fine
int c = (*p)(1,2); //function pointers need to have (parentheses) around them (*p) like this
                   // could use p(1,2) like this as well
//----------------------------------------------------------------------//

int *p(int, int) // this syntax means that it will return an int*

```

## Function callbacks

When address of a function is passed to another function, that task is called callback function\

## Competitive notes

```c
ios::sync_with_stdio(0);
cin.tie(0);
```

newline "\n" works faster than std::endl cz endl causes a flush operation

`getline(cin, s);` takes a full line inside the string s

If the amount of data is unknown, the following loop is useful:

```c
while (cin >> x) {
// code
}
```
