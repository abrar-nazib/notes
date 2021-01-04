# All About Pointers

## After Basics

```c++
int *pointer;
int* pointer; //same thing

int *pointer = &variable_to_track;
```

## Pointer Arithmatics

Supports basic addition and substruction```*(p + n) -> n = type_dependent_size* n```

## Void Pointers

```c++
void *pointer; // can not de reference
               // can not even perform pointer arithmatics
```

## Pointers to Poitners

& operator provides the address of the variable\
lots of aestrestics. Nothing else.

## Pointers and arrays as function arguments

```c++
int function_definition(int* ptr);
int main(){
    function_call(&address);
}
```

In case of array passing, the stack frame of the invoded function does not copy the value of the array in it's stack frame\
rather it creates a pointer variable which points to the main local variable\
could be said that **arrays are called by reference**\
So the size of the array is needed to passed wih the array as an argument

```c++
int this_function_accepts_array(int array[]); //good practice
int this_function_accepts_array(int* arrrays_first_elements_address) //actually this happens

```
