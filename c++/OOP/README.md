# Object Oriented Programming with c++

---

## Basics

writing classess is like writing a new data type\

## Classes VS Structs

Property visibility is set to private in classes\
Classes are private by default where Structs are public by default\
But both are like new data types

## Static keyword

Static means the variable or method will be available for only this translation unit

## Extern keyword

Extern keyword will look for the variable or method in other translation units\
Will look for static variables or methods actually

## Static in classes and structs

static variable inside a class: there will be only one instance of that variable accross all the instances of the classs\
it's a little bit messy idea. Suppose I have some objects derived from a certain class. and they all have a static variable\
named __bal. If you change this variable in any of the objects, it will be changed in all other objects(instances) as well\
static means that there is only one instance of that variable\
Static method can not access a non-static variable

### Local Statics

variable will be local -> could be accessed from that perticular scope only but the lifetime of the variable \
will be the lifetime of the program\
Handy when you don't want to make a global variable but don't want the local variable be re-initialized again and again.
difference with global -> globals are accessible in global scope, local statics are not.

## Struct

```C++
struct Name{
    //properties
    int x, y;
};
```

struct initializer syntax

```C++
Name variable;
Name variable2 = {4, 5}
```

## Constructors

Basically a method which is called whenever an instance is made from a class
constructor method has to have the name of the class
could have multiple constructor functions
if constructor function is kept inside private it means you can not instantiate the class
you have to access the properties with ```class_name::function_name()``` type of syntax
```class_name::function_name()``syntax could be used for accessing the class constructor from outside the class\
initiatialization\

Deleting the default constructor: ```class_name() = delete``` inside the class

```C++
class Entity{
public:
    Entity(){
    // code here
    }

};
```

## Destructors

Function to run when you destroy an instance of that class\
general syntax is: ```~class_name(){}```\
Stack allocated ( will discuss about it later)\
Important: If some memory is allocated in heap manually, you have to clean it manually. It is where destructor comes\

## Inheritance

hierarchy of classes: Main class(parent) and subclass(branch classes) idea.\
important for avoiding code duplication\

```c++
class class1{
    //some code
    };
class class2 : public class1{
    //class2 extends class1
    //class2 has all the properties that class1 has
};
```

## Virtual functions

Allows to override methods in subclasses\
```virtual vfunction(){//function_definetion}``` creates a vTable for this specific function\
Which allows to overide the methods of parent class
```function_type function_name(parameters) override {function definition}```
override keyword is optional. but a good practice\
need extra memory for vtables

## Interfaces

Specific type of virtual function(pure virtual function)*Abstract method may b*\
No implementation in the base class. Subclasses are forced to implement this virtual function\
```virtual function_type function_name() = 0``` says you have to implement this this function in all the subclasses

## Visibility  

3 types of visibility are there -> Private, Protected, Public
visibility of Properties in classes are set to private\
Private properties in classes can be accessed only from within that class and 'friends'. Not even subclasses of that class can access these properties.\
Protected -> Less visible than Public but more visible than Private.\
Protected properties could be accessed by main class and all the sub classes in the heirarchy\
Can not accessed from outside of the class heirarchy\
Protected properties could be accessed from constructors may b? otherwise shows errors
