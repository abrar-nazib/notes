# C++ Programming Basics

## Memory

Memory is devided into three sections:
|                      |
| -------------------- |
| Heap(actually Stack) |
| Stack(actually Heap) |
| Code                 |

Programs can directly access code and stack portion of the memory. Can't access heap portion of the memory.

## Arrays

Collection of similar data elements

```c++
int a[size]; //If declared this way, the array will be created in the stack segment of the memory
int arrayName[size] = {el1, el2, el3, elN}; //Declaration and initialization syntax of an array
```

## Structures

Collection of data members that are related and is under one name. Data members could be of similar type or dissimilar type.\
Usually defined as collection of dissimilar data members under one name. It means grouping of the data items\
C++ does not need to specify ```struct``` keyword everytime in the main code as c\

```c++
struct Rectangle{
    int length, breadth;
};                              //Definition syntax of a struct

int main(){
    struct Rectangle rect = {len, bre};
}
```

**Usage of pointers in Structure:**\

```c++
struct Rectangle{
    int length, breadth;
}

//--------------------Stack----------------------------------------
struct Rectangle rect = {10,2};
rect.length = 20; //normal style of accessing the struct elements
struct Rectangle* pRect = &rect;
pRect.length = 11; // Doesn't work
*pRect.length = 12; // Doesn't work either cz it's the same as *(prect.length)
(*pRect).length = 15; //C style of accessing a struct element using pointers
pRect->length = 18; // C++ style of accessing a struct element

//----------------------Heap----------------------------------------

struct Rectangle* rect;
rect = (struct Rectangle*)malloc(sizeof(struct Rectangle));
cout << rect->length << rect->breadth << endl;
```

## Pointers

**Definition:** Pointers are address variables meant for storing adress of data\
Pointer variables will be also located in stack.
These are used to:\

1. Accessing heap
1. Accessing resources
1. Passing parameters

**Stack Memory syntax:**

```c++
int a=1; //data variable
int *p; //declaration of pointer variable
p = &a; //assignment of pointer variable => address variable  p is storing the address of a
cout << p; //will print the address of a
cout << *p //will print the contents of the memory p points to => in this case a
           //*p is called dereferencing
```

**Heap Memory syntax:**

```c++
#include<stdlib.h> //need to include this in c to use malloc() function
//malloc returns void type pointer so it has to be casted the intended type while initialized
int *p = (int*)malloc(size); //malloc takes how much memory to be allocated
int *p = (int*)malloc(n*sizeof(int)) //traditional style of allocating memory => allocating integer-size memory of n numbers in heap
int *p = new int[5] //Does the same thing as above but the syntax is for c++
```

## Reference

Only available in c++\
**Definition:** A reference is nickname or alias given to a variable. It is nothing but creating a variable with two names.\
References are useful in parameter passing.

```c++
int a = someValue;
//A reference variable must be initialized whenever is declared
int &r = a; //here the variable r is the alias of a
```

## Functions

A piece of code performing specific task.\
When a function is called its own stack frame is created. After activation, its activation record/stack frame is deleted\
**Parameter Passing Methods:**\

1. Passing by value
2. Passing by address
3. Passing by reference

```c++
void swap(int* x, int* y){  //call by address function design
    int temp = *x;
    *x = *y;
    *y = temp;
}
swap(&a, &b); // call by address
//-----------------------------------Reference-------------------------
void swap(int& x, int& y){  //call by reference function design
    int temp = x;
    x = y;
    y = temp;
}
swap(a,b) //call by reference
// Reference is nothing but alias to a variable. Here the main function is calling the variables as a,b but the swap function
// is calling them as  x,y. Nothing so complicated
// may be it could be defined as &x = a, &y = b
```
