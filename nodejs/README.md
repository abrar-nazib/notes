# Notes on nodejs

[All Nodejs Apps](https://abrar-nodejs-apps.herokuapp.com/)

[Node documentation](https://nodejs.org/dist/latest-v14.x/docs/api/)

## Basic Theoretical stuffs

- Just a powerful version of javascript which can run as a process\
   in local machine and do the usual stuffs other programming languages do.
- Can be said server side javascript.
- Chrome's V8 javascript engine is used in creating node's javascript engine.
- V8 engine is written in c++

## Special Variables

- `__dirname` stores the full path of current directory
- `__filename` stores the full path of the current file

## Process object

```bash
process.exit()
   # exits from the node shell. (.exit works as well, the default object is process)
process.argv
    # stores the command line arguments in an array. -> argv=argumentsVector
    # the first two elements of the array is node and app's location
```

## Exporting

- Files loaded with `require()` does not share it's variable.
- Have to export specific variables/functions to make it available for others
- Trailing things not specified.

```javascript
module.exports = "variable/function";
// for exporting a single variable or a function
```

## Package-json file

### Node Scripts

```javascript
"scripts":{
        "start": "node src/app.js",
        "dev": "nodemon src/index.js"
}
```

```bash
npm run dev # will run dev script on the server
```

## NPM and NPM modules

### Initialization

```bash
npm init        # starts a node project
                # creates package.json file
```

### Package Installation

```bash
npm install     # installs all the required packages according to the package files
                # recreates the node_modules folder
npm i[nstall] package_name  # installs the latest version of the package
                    # creates a node_modules directory to keep the downloaded packages
                    # creates a package-lock.json for security purposes
npm i[nstall] package_name --save-dev   # install the package locally and list it as a dev dependency
                # Locally installed dependencies could not be accessed from terminals
                # They could be accessed from package.json scripts though
npm i package_name@version # installs the specific package
sudo npm -g i package_name       # installs the package in global scope

```

### fs

```javascript
const fs = require("fs");
fs.writeFileSync("file_path", "Buffer to be written on the file");
// Creates a file and writes to it in synchronus way.
fs.appendFileSync("file_path", "Buffer to append");
// Appends the buffer in the specified file in synchronus way.
const dataBuffer = fs.readFileSync("file_path");
// returns binary data from file
const dataJSON = dataBuffer.toString();
//converts in json format if the file is formatted properly
```

### validator

[Validator Doc](https://www.npmjs.com/package/validator)

```javascript
//npm i validator     // installs the validator package
const validator = require("validator");
// returns a validator object
validator.isEmail("mail@email.ext"); // returns boolean
validator.isURL("https://url.ext"); // returns boolean
```

### chalk

```javascript
npm i chalk     // installation
    //########Have to use it inside console.log####################################
require("chalk");
chalk.color("text") // color=blue,green,yellow,black,etc
chalk.bgColor("text") // bgColor=bgBlack, bgRed, bgGreen, etc
chalk.modifiers("text") // modifiers=bold,italic,strikethrough
chalk.color.bgColor.modifiers("text") // multiple options could be used, no serial
```

### nodemon

```bash
npm i nodemon -g    # installation nodemon globally

nodemon app.js      # runs app.js and updates with each save of .js files by default

nodemon app.js -e js,sbs,html   # restarts running with changes of files with extensions specified

```

### yargs

```javascript
yargs.argv      // returns the command line arguments array
yargs.parse()   // parses all the argv commands
                // if not called, don't print anything in the entire code.
node file.js --argument="value"
                // yargs stores this type of arguments in key-value pair
node file.js valuelessArgument1 argument2
                // yargs stores this type of arguments in another array
node file.js --help
                // yargs shows a help menu
yargs.version('1.2.1')
                // specify the version while --version is inputted
yargs.command({
        command:'commandKey',
        describe: 'What this command does',
        builder:{
                title:{
                        describe: 'Builder option description',
                        demandOption: true,     //makes this option mandatory
                        type: 'expected input type',    //string, array, etc
                    }
            },
        handler: function(argv){
                //handlerCode with passed arguments
            }
    })
```

## Debugging

```javascript
debugger;
// if put in a certain line, program stops at that line and then the other variables could be seen from the terminal.
```

```bash
node inspect file.js [other options] will start node debugger
```

In chrome, type `chrome://inspect` to inspect the files

## Asynchronus Nodejs

**Keywords:**

- Call Stack
- Node API
- Event Loop
- Callback Queue
  - Maintains a list of all the callback functions

```javascript
setTimeout(()={}, s)
//execute the first function after s milliseconds
//here first parameter is a function
// time is in milliseconds
```

For asynchronus function, a funcion call doesn't wait for the task to be completed.\
Rather it registers an event-callback pair in NodeJS API. Callback is the function to be run.\
Thus the call stack gets to run other functions while the callback is being processed.\
Asynchronus functions could not be pushed in the call stack by the event loop if it's not empty.\
Even the main function has to be removed from the stack.\
Meaning: Asynchronus functions run after all the synchronus functions has run

## Callbacks

A function which is provided inside another function as an argument with an intention of calling it later on.

```javascript
//basic structure of a callback function
const asynchronusFunction = (parameter1, parmeter2, parmeterN, callback) => {
  //things to do with parameterObject
  callback(dataToReturn);
};

asynchronusFunction(paramter, parmeter2, parmeterN, (dataReturned) => {
  //thing to do with the data returned from callback
});
```

## Promises

```javascript
const promiseExample = new Promise((resolve, reject) => {
  //some time consuming function
  if (successful) resolve(dataToBePassedIfOperationSuccessful);
  else reject(rejectionMessage);
});

promiseExample.then((result) => {}).catch((error) => {});
// Then allows us to register a function when things went smoothly
// Catch allows us to hancle errors correctly

//                          Fulfilled
//                        /
// Promise -- pending -->
//                        \
//                          Rejected
```

### Promise Chaining

```javascript
const add = (a, b) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(a + b);
    }, 2000);
  });
}; // Function add returns a promise

add(4, 5)
  .then((sum) => {
    console.log(sum);
    return add(sum, 9); // returning another promise
  })
  .then((sum) => {
    // Handling the returned promise outside (syntactical suger)
    console.log(sum);
  })
  .catch((error) => {
    console.log(error); // Handling two errors with only one block
  });
```

## Async-Await

- `async` Allows us to create an async function and in that function we can use `await` feature.
- To create an async function we have to put `async` before that function.
- Async functions always returns a promise
- Can not use `await` outside of an `asysnc` function.

```javascript
const add = (a, b) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(a + b);
    }, 2000);
  });
}; // Function add returns a promise

const doAdd = async () => {
  const sum1 = await add(1, 2);
  const sum2 = await add(sum1, 3);
  const sum3 = await add(sum2, 4);
  return sum3;
  // Equivalent to promise chaining, Just syntactical sugar
};
```

## HTTP Related methods

### `http`

```javascript
const http = require("http"); //same goes for https

const request = http.request("url", (response) => {
  /* Event Handling*/
  let data = "";
  response.on("data", (bufferChunk) => {
    data = data + chunk;
    //here response comes as a form of buffer, chunk by chunk
    //whenever a chunk of data is coming, we are saving it into the data variable
  });
  response.on("end", () => {
    const body = data.toString();
    // When all the bytes has successfully reached the destination
  });
  response.on(
    "error",
    (error = {
      //do something with the error
    })
  );
});

request.end(); //mandatory thing to do, otherwise will continue to listen for response
```

### `request`

Request is an asynchronus function by default.

```javascript
const request = require("postman-request");
request({ url: url }, (error, response) => {
  /*function to run when the response arrives*/
  console.log(response.body); // Stores the body of the response
});
//first parameter of reqest
firstparamObject = { url: url, json: true };
// json:true -> response json is parsed autometically
```

### `encodeURIComponent`

```javascript
encodeURIComponent(data); //URL encodes the passed data
```

## Templating

### `handlebars for express -> hbs`

- Handlebar's template folders has to be kept inside a folder named 'views' in the root of the server
- Each template file has to have `.hbs` extension

```javascript

//Editing the default view engine folder location
const viewPath = path.join(__dirname, 'relative_path_according_to_the_present_directory')

app.set("view engine", "template_engine_name"); //template_engine_name = hbs
                // for specifying which templating engine to use
app.set("views", viewsPath)     // replace views with path to new view engine directory path
app.get('',(req, res)=>{        // first parameter * for 404 page
        res.render('filename_without_extension_inside_views_folder', {object_with_key_value_pair});
        //for rendering dynamic html file from any templating engine
        //need to use some variables inside the template. The object passed stores the needed variables
})

//--------------- inside the template file --------------
<h1>{{variable}}</h1>   // this is how variables are used
//-----------------     -----------------------
```

**Partials:** Not full page of template. Parts of a page. eg: navbar, header, footer

```javascript
const hbs = require('hbs')
// Defining path for partials directory
const partialsPath = path.join(__dirname, "../templates/partials");
//letting hbs know about the partials directory
hbs.registerPartials(partialsPath);
// how to use partials in hbs files
{{>partialfilename}}
```

## Rest API and Status codes

- **REST:** Representational State Transfer
- **API:** Application Programming Interface

REST API allows clients to manipulate and access resources using a set of predefined operations.

- GET: Fetch Data
- POST: Write Data. Success: 201, Failed: 400(due to invalid input)
- PATCH: Update Data
- DELETE: Delete Data

**Status Codes:**

- 200 OK
- 201 Created
- 400 Bad request
- 401 Unauthorized
- 500 Internal Server Error

![REST API Structure](Assets/restapistruct.png)

## Postman

- POST data to be inputted inside body tab of postman. Body -> Raw -> JSON

**Postman Environments:**

- Create environment to store environment variables such as url
- Set variable name and value
- Usage: `{{variablename}}` in the requests

**Postman Authorization:**

- Project name burger -> Edit -> Authorizatoin.
- In Single request: Inherit from parent.

**Postman Scripts:**

- Pre-request scripts: Can write some javascript code before sending request.
- Test: Javascript code to be written after the response is received.

```javascript
// Authentication script

pm.response.code  // contains the response code
pm.environment.set("variablename") = value; // Setting an environment variable of postman.
pm.response.json()  // grabs json object of the response and converts it into a javascript object.
```

## Hashing

### Bcrypt

- `npm i bcryptjs`

```javascript
bcrypt = require("bcryptjs");

const asyncFunction = async () => {
  const hashedPassword = await bcrypt.hash(plainTextPassword, n); // n = how many times to hash the text. Ideal is 8
  const isMatch = await bcrypt.compare(plainTextPassword, hashedPassword); // Returns boolean value
};
```

See mongoose middlewares notes for utilization example of bcrypt

## Port related stuffs

```javascript
const port = process.env.PORT || 3000; // Check for environment variable to decide port otherwise use 3000 for dev

app.listen(port, () => {
  console.log("Server is up on port ", port);
});
// Here app is express app object
```

## JSON Web Tokens

- `npm i jsonwebtoken` to install
- `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiJhYmMxMjMiLCJpYXQiOjE2NTAxODE1NDl9.DjW8q1UJreiWpfiBAZAYCwRX9xwPI6HHxwWQPireEBo` example json web token
- Json web tokens has 3 parts
  - Header: base64 encoded json string. Contains what type of token it is, the algorithm used to generate it.
  - Payload/Body: Second portion where data is stored.
  - Signature: For checking integrity.

```javascript
const jwt = require("jsonwebtoken");

const token = jwt.sign({ dataToStore }, "secretString", {
  expiresIn: "7 days",
}); // Creates a json web token.
// expiresIn = select the time after which the jwt will expire. {seconds, minutes, weeks, years, months could be used}

const data = jwt.verify(token, "secretString"); // returns the payload section if verified otherwise returns error
```

## Useful other functions needed to work with nodejs and servers

**`parseInt()`:**

```javascript
const stringValue = "1";
const intValue = parseInt(stringValue); // parses string into integer
```

**`split()`:**

```javascript
const testString = "hello-there";
const splittedStrings = testString.split("-"); // splittedStrings = ['hello', 'there']
```

**`foreach()`:**

- The `forEach()` method executes a provided function once for each array element.

```javascript
const array1 = ["a", "b", "c"];

array1.forEach((element) => console.log(element)); // will print all the elements in the console
```

**`endsWith()`:**

- Used for getting the extension of a file

```javascript
const fileName = "file.ext";
const fileExtension = fileName.endsWith(".ext"); // returns true if file ends with .ext
```

### Regular expressions

```javascript
const exString = "string.ext";
const isCorrectExtension = exString.match(/\.ext$/); // The / / are needed for regular expressions
```

## File uplaods

**`multer`:**

- Multer is for multipart/form-data
- `npm i multer` for installation

```javascript
const multer = require("multer");
const upload = multer({
  dest: "destinationFolder", // will save the file inside this specific directory
  // Don't put the dest property if don't want to save it inside any folder. EG. saving in database.
  limits: {
    fileSize: 1000000, // Restricting file size to one million bytes -> one megabyte( 1*10^6 byte)
  },
  fileFilter(req, file, cb) {
    // function to be run when new file attempted to be uploaded
    // req: information about request being made
    // file: information about the file being uploaded
    // cb: callback function to be called when we're done. Used for delivering error messages

    cb(new Error("error message")); // to be called if anything goes wrong
    cb(undefined, true); // If everything's allright, Second argument to indicate the file upload process should continue.
    cb(undefined, false); // For silently rejecting file. {bad practice}
  },
});

app.post(
  "/route",
  upload.single("parameterName"),
  (req, res) => {
    // upload.single() returns a middleware
    // route-handler
  },
  (error, req, res, next) => {
    // Error handling code for error thrown by multer middleware
  }
);
```

## Showing binary image data in browser

```html
<img src="data:image/jpg;base64,[binaryBase64EncodedData]" />
<!-- image/jpg means which type of image to parse. Normally binary data comes from base64 -->
```
