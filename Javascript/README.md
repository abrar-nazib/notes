# Javascript Notes

## Threading, Asynchronus, Synchronus, Non-blocking

V8 Engine has two parts

1. Memory Heap
   - Memory Allocation is done here
2. Call Stack
   - Code is read and executed here

**Memory Leak:** When the memory heap gets full by global variables(if not cleaned), it's called a memory leak.\
**Single Threaded:** Javascript has got only one call stack. It can execute only one task at a time.

## String and String functions

```javascript
const string = "value"; // declaration

string.charCodeAt(0); //returns v's ASCII/UTF-16 code in decimal

string.includes("searchvalue", start); // returns true if the string contains searchvalue. The start is default to 0

string.toUpperCase(); // returns uppercased string
string.toLowerCase(); // returns lowercased string

const array = string.split(""); //splits the string characterwise and creates an array
const string = array.join(""); //creates a string from the array elements
// if used like join(), commas are converted into string
```

## Array and Array functions

```javascript
const arr = [1, 2, 3, 4, 5];
arr.forEach((element) => {
  console.log(element);
}); //will print all the element
const newArr = arr.forEach((element) => element); //newArr will be undefined

const newArr = arr.filter((element) => element); //all the elements inside arr is now inside newArr

const foundElement = arr.find((element) => element === match); //returns the element which matches to the "match"

const testAll = arr.every((param) => {
  /*testFunctionCriteria*/
});
// The every() method tests whether all elements in the array pass the test implemented by the provided function.
// It returns a Boolean value. True if every element follows criteria. False if any of them do not
```

## Classes and Objects

1. Reference type object
2. Context
3. Instantiation

**Reference Type:**\
Jacascript objects are reference types.

```javascript
var objectX = {
  key1: "value1",
  key2: "value2",
  key3: "value3",
}; //here the 'object1' stores the reference to the object. Not the object itself.
// Much like pointers
objectX.keys(); // returns an array containing keys of the object
Object.keys(objectX); // same
```

**Context:**\
Within which object we are right now is the context.

```javascript
this.method(); // here this is the current context/current object we are inside of  66
```

**Instantiation:**\
When we make a copy of the object to reuse the code.

```javascript
class Player {
  constructor(name, type) {
    // constructor is the function which is run first everytime a new object is created.
    this.name = name;
    this.type = type;
    this.deltable = "mairala";
  }
  introduce() {
    console.log(`Hi`);
  }
  delete() {
    delete this.deletable; // for deleting a preperty from the object
  }
}

class Wizard extends Player {
  // Class instantiation
  constructor(name, type) {
    super(name, type);
  }
  play() {
    console.log("Playing");
  }
}

const wizard1 = new Wizard("Abrar", "Programmer");
```

### Object Propery shorthand

New in JavaScript with ES6/ES2015, if you want to define an object who's keys have the same name as the variables passed-in as properties, you can use the shorthand and simply pass the key name.

```javascript
let cat = "Miaow";
let dog = "Woof";
let bird = "Peet peet";

let someObject = {
  cat, //instead of cat:cat
  dog,
  bird,
};
```

### Object and Array Destructuring

The destructuring assignment syntax is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.

```javascript
let [a, b] = [10, 20];
// a = 10, b = 20
let [a, b, ...rest] = [10, 20, 30, 40, 50];

console.log(rest); // rest = [30,40,50]

const x = [1, 2, 3, 4, 5];
const [y, z] = x; // y=1, z=2 -> const [firstElement, secondElement] = list;

const user = {
  id: 42,
  isVerified: true,
};

const { id, isVerified } = user;
// id = 42, isVerified = true
```

## Arrow functions

```javascript
const object = {
    property1: "value",
    property2: function(){
        console.log(this.property1); //returns "value"
    },
    property3: () => {
        console.log(this.property1); //returns undefined
    },
        console.log(this.property1); //returns "value"
    },
    arrayProp:["mairala", "kaittala", "uraiala"],
    iterator1:function(){
        this.arrayProp.forEach(function(element){
            console.log(element); //prints undefined
            //because "this" inside a general function has its own scope
        });
    },
    iterator2:function(){
        this.arrayProp.forEach((element)=>{
            console.log(element); //prints every element
            //because "this" inside an array function does not have it's own scope
        });
    }
}
```

Arrow functions act differently inside objects while acting as a property

## Error Handling

```javascript
try {
  //code to run
} catch (error) {
  //the error from the try block will be used as parameter in this catch block
}
```

### Error Throwing

```javascript
throw new Error("error message");
```

## JSON

```javascript
JSON.stringify(object); // converts the object into json string
JSON.parse(JSONstring); // converts json string into JS object
```

## Other Uncategorized functions

```javascript
setTimeout(()={}, s)
// Wait x miliseconds. After x miliseconds is over,
//execute the first parameter's function.
//here first parameter is a function
// time is in milliseconds
```

## Fetch

- Fetch is an asynchronus function which returns a promise.

**Getting text files:**

```javascript
fetch("filename.txt").then(function (res) {
  console.log(res);
});
```

**Post requests with fetch:**

```javascript
fetch("url"{
    method: "POST",
    headers:{
        //headers to send
    },
    body:{
        // body to send
        // if the body needs to be json data, send like:
        // JSON.stringify({ /* body data */ })
    }
})
```

**The Response(`res`) Interface:**

- `text()` parses text and returns string.
- `json()` parses json data and returns javascript object.

## DOM and events

```javascript
const classElement = document.querySelector('.className');  // select element by class
const idElement = document.querySelector('#idName');    // select element by id
const form = document.querySelector('form');    // select element by tag
form.addEventListener('submit',(e)={    // e is the event which occures while submit is pushed
    e.preventDefault(); // submit's default behavior is to refresh the browser. Preventing this default behavior
})

element.textContent = 'modifiedContent' // modifying the text content of the element
```

**Adding event-listeners to an element:**

```javascript
document
  .getElementById("elementId")
  .addEventListener("eventType", functionToRunWhenEventIsTriggered);
// eventType examples: click, submit
```

## Promises and Callbacks

```javascript
//------------- Callback Pattern ----------------------------------------------------
const callbackFunction = (callback)={
    // Some time consuming task
    callback(param1, param2); // The convension is callback(error, result)
}

callbackFunction((param1, param2)=>{
    //do what to be done with param 1 and 2
})

//--------------- Promise Pattern ---------------------------------------------------
const promiseFunction = new Promise((resolve, reject)=>{
    //some thime consuming stuffs
    if(positive_criteria){
        resolve("things to be returned if things went well");
    }else{
        reject("things to be returned if things did not went well");
    }
})
promiseFunction.then((result)=>{// registers a function when things go well
    // things to do with result
});
promiseFunction.catch((error)=>{// registers a function when things goes wrong
    //things to do with the error message
})
// then() and catch() both could be used together

//----------- Vocabulary Related to Promises -----------------------------------
//                              ___ Fulfilled
//                             /
// Promise   ---------> pending
//                             \___ Rejected
```

### Promise chaining

```javascript
add(1, 1)
  .then((sum) => {
    console.log(sum);
    return add(sum, 4); // Returned promise goes to the second then() block to handle
  })
  .then((sum2) => {
    console.log(sum2);
  })
  .catch((e) => {
    console.log(e);
  });
```

## Async Await

- Async functions always return promise
- Return in async function is equivalent to resolve in promise
- Throw error in async function is equivalent to reject in promise

```javascript
const asyncFuncton = async (params) => {
  const data = await anotherAsyncfunction(); // awaits could be used inside only async funcitons
};

const anotherAsyncfunction = async () => {
  //some time intensive task
  return data;
};
```
