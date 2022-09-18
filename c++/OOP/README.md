# Organized OOP Notes

Learning OOP in the finest way is the top priority. Must understand every topic.

## Classes and Objects

Classes are user defined data types which works like a blueprint to create more and more objects from it\
Naming conventions:```CamelCase```\
Syntax:

```c++
class ClassName{
public:
    //public properties and methods
private:
    //private properties and methods
};
```

Objects are created according to the blueprint of the class\
Syntax:

```c++
//Object creation
ClassName object;   //will be allocated in the stack
Classname *object = new ClassName(); //will be allocated in the heap and will be dynamic memory{NB: new keyword returns a pointer}

//accessing and modifying properties
variable = object.variable; //for stack allocated classes
variable = object->variable; //for heap allocated classes

// accessing methods
returned_value = object.method(parameters); // for stack allocated classes
returned_value = object->method(parameters); // for heap allocated classes
```

## Access Specifiers

**Public**:\
Property or method accessible to anyone(need detailed review)\
**Private**:\
Property or method *directly* accessible to only class(inside class definition) even not to sub classes\
Have to write public methods which can access the properties. Main objective is to keep "Properties" a secret.\
Properties will be considered private if no access specifier is defined(default access specifier of c++)\
**Protected**:\
Properties accessible inside class definition and to the subclasses

## "::" The scope resolution operator and Methods outside classes

Properties and methods could be defined inside or outside of the class definition\
Class Methods outside the class definition{in the global scope} could be defined using a scope resolution operator\
Syntax:

```c++
class ClassName{
public:
    int property1;
    int property2;
    string property3 = "default value";
    void method_name(int parameters); //medhod declaration 
};
void ClassName::method_name(){ //void could be replaced with any return data type
    //accessing class properties using scope resolution operator
    cout << property1 << endl; //works but not the best practice (will be cleared in private section)
    cout << ClassName::property2 << endl; //best practice
    ClassName::property3 = "modified value";
}
```

## Class Constructors

Constructor should have the same name as the class name and should not have any return type\
Constructors are called autometically whenever an object is created, can't call them manually\
Class constructors must be public, otherwise will throw an error because private methods cannot be accessed from anywhere but the class itself\
Syntax:

```c++
class ClassName{
    ClassName(parameters){
        //things to do when an object is created
    }

};
ClassName object(parameters); //used to create an object from class
```

Classes have a default constructor, if no constructor is defined, default constructor is kicked. This constructor does not take any parameters

## Class Destructors

Invoked whenever an object is gone out of scope or terminated using delete operation as the memory gets freed\
Important thing to remember for destructors: Must free the heap allocated memories using ```delete``` keyword while terminating. Otherwise it's gonna create some real nasty bugs\
Syntax:

```c++
class ClassName{
    ClassName(parameters){
        //constructor operations
    }
    ~ClassName(){
        //destructor operations as the memory gets freed
        //most likely can't take any parameters
    }
};

delete object; //invokes the destructor as the memory gets de allocated
```

## All about Overloading

Overloading is the basic idea of multiple variable type compatibility in functions(methods in classes)\

### Overloading Constructors

Constructors are also functions themselves and so they can be overloaded as well\
Syntax:

```c++
ClassName{
    private:
    int property1;
    string property2;
    ClassName(){
        property1 = 0;
        property2 = "default_value";
    }
   ClassName(int in_property1){
        property1 = in_property1;
        property2 = "default_value";
    }
    ClassName(string in_property2){
        property1 = 0;
        property2 = in_property2;
    }
    ClassName(int in_property1, string in_property2){
        property1 = in_property1;
        property2 = in_property2;
    }
    ClassName(int in_property1 = 0, string in_property2 = "default_value"){
        //other constructor definitions 
    }
};
```

## Static Keyword in C++

### Static Properties

The property or variables declared with static keyword will be stored in the heap and that line of code will be executed just once\
The concept gets clear in the usage in classes. A static class property has only one instance of that property no matter how many instances(objects) are made from the class. *The value of a static property can not be set inside a class. It has to be set somewhere outside of the class definition*\
Syntax:

```c++
void count(){
    static int times = 0;
    cout << ++times << endl;
}
class Clock{
public:
    static int id;  //property declaration
};
int Clock::id = 1;  //property definition

int main(){
    count();    //count = 1
    count();    //count = 2
    cout << Clock::id <<endl;
}
```

### Static Methods

Static methods will have class scope. Means the method will be shared by all the objects.\
Can use only static properties in the static method. Have to call them using scope resolution operators\
Syntax:

```c++
class ClassName{
    static int objectCount;
    static int objects(){
        return objectCount;
    }
    ClassName(){
        objectCount++;
    }
};
int ClassName::objectCount = 0;
int main(){
    ClassName object1;
    ClassName object2;
    ClassName object3;
    cout << ClassName::objects() << endl;
    return 0;
    }
```

## Friend functions

Friend methods can access private properties of a class\
Syntax:

```c++
class ClassName{
private:
//properties
public:
//constructors
friend friendFunction(ClassName object); //declaration that a friend function exists

};

void freindFunction(ClassName object){
    cout << object.property; //accessing object's private properties
}

```

## Friend Classes

Will be discussed later

## Inheritance

A process of getting the features of other class. Could be called child(sub) class inheriting parent's(base's) properties and methods\
Child(sub) classes inherit all non-private methods and properties. It's not gonna inherit constructors, destructors, friend functions\
Inheritance syntax:

```c++
class ParentClass{
    // Parent properties and methods
};
class ChildClass : public Parentclass
{
    // extra properties and methods
};
```
