# Notes on c++

---

## Visual Studio Settings

### Keyboard Shortcuts

* ctrl f7 -> Individual file compilation
* f5 -> Build and run Project
* f9 -> creates a breakpoint on the line(cursor's line)

### Configuration settings

* All configurations <-> All platforms
  * Output directory : $(SolutionDir)bin\$(Platform)\$(Configuration)\
    * Intermediate directory: $(SolutionDir)bin\intermediates\$(Platform)\$(Configuration)\
* C++ -> Optimization -> maximize speed //not necessary

*

## Compilation Process

every translation unit gets compiled into an object file.

## Linking Process

## Debugging

* Breakpoints
  * f9 puts a breakpoint in the cursor's line in VS.
    * Step over button(f10) lets go over another line.
    * step into button lets lookup into function code upon call
    * continue button runs the program until it hits the next break point

* Memory Lookup
  * Debug > Windows > Memory for memory view ```&variablename``` shows the variable in the memory 

## Important Commands for linux

```bash
g++ file.cpp #compiles the file.cpp and creates a *.out file -> executable
g++ file1.cpp file2.cpp #compiles the files to a single *.out file
g++ -c file1.cpp file2.cpp #creates  object files file1.o file2.o
g++ file1.o file2.o #compiles the object files

```

## GDB commands

```bash
g++ -g file_mame.cpp # must compile with -g for debugging
gdb executable_file #starts a debugger session
b function_name #setting a breaking point on a function
b line_number #setting a breakpoint on line
n #goes to next line -> next
s #goes inside the function call -> step
f # where the fuck am I?
backtrace #on which function you are now and the pathway to this function
info b #shows the numbers of breakpoints in your code
info locals #shows the state of all local variables
delete 1 #delets the breakpoint 1
f frame_number #frame number is the function number from backtrace
```

## Makefiles

```makefile
file_to_be_made: from_which_file1 from_which_file2
    command to create file_to_be_made
```

## Pointers

* pointers are actually integers storing memory addresses

## Referencing

* disguised pointers

## Enums

enumeratin -> Practically it is just is an integer
by default, But type could be cast.

```C++
enum Enumeration : unsigned int{
    var1 = 1, var2 ,var3, var4
};
```

## Arrays

An array is really just a pointer to a memory address\
Can create some serius problem if tried to access index out of the scope of the array length
Array indexing in memory -> 0 index: don't add anything with the memory address\
                         -> n index: add (n * size_of_variable_type) with the memory address
Basic syntax:\

```c++
int arr[n]; //stack array -> gets destroyed with the scope(when hits the curly brace)
int* arr = new int[n]; //heap array -> have to destroy with delete[] arr keyword
#include <array> //for c++ 11 arrays
std::array<int, 5> array_name; //another.size() makes life good :)

```

array element retreival technique ``` sizeof(array) / sizeof(data_type) ``` sizeof() returns memory allocation of the variable\
but can only be retreived from stack arrays. not heap arrays are available in this method

## Strings

```c++
const char* string_name = "staring";
char* srting_name = "string"; //doesn't work in my pc :|
#include <string> //for c++ standard library -> will be using this one
std::string string_name = "string value "; //creates a const char pointer
```

const is used because strings are basically fixed allocated memory like arrays 
Null Termination character : determines where the string ends 0x00 for 1 or multiple bytes (ascii value 0)

### About std::string s

by calling std::string string_name I might be calling instanciating an object from a string class\
iostream header file does have a definition for strings though it can no cout strings if string header is not included(reason not clear yet)\
using string class -> some methods can be accessed as well\
Appending strings: ```std::string string = "nazib" + "abrar";``` doesn't work cz can not add const char arrays. cannot glue two pointers together\
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

* Const keyword in Class methods

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
