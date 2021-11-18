# Javascript Notes

## Strings and String functions

```javascript
const string = 'value'
string.charCodeAt(0); //returns v's ASCII/UTF-16 code in decimal
```

## Classes and Objects

1. Reference type object
2. Context
3. Instantiation

**Reference Type:**\
Jacascript objects are reference types.

```javascript
var object1 = {name: 'value'}; //here the 'object1' stores the reference to the object. Not the object itself.
// Much like pointers
```

**Context:**\
Within which object we are right now is the context.

```javascript
this.method(); // here this is the current context/current object we are inside of  66
```

**Instantiation:**\
When we make a copy of the object to reuse the code.

```javascript
class Player{
    constructor(name, type){    // constructor is the function which is run first everytime a new object is created.
        this.name = name;
        this.type = type;
        this.deltable = 'mairala'
    }
    introduce(){
        console.log(`Hi`);
    }
    delete(){
        delete this.deletable; // for deleting a preperty from the object
    }
}

class Wizard extends Player {       // Class instantiation
    constructor(name, type){
        super(name, type);
    }
    play(){
        console.log('Playing');
    }
}

const wizard1 = new Wizard('Abrar', 'Programmer');
```

## String and Array

```javascript
const array = string.split("");     //splits the string characterwise and creates an array
const string = array.join("");    //creates a string from the array elements
// if used like join(), commas are converted into string
```
