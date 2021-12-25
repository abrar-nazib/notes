# Notes on nodejs

[All Nodejs Apps](https://abrar-nodejs-apps.herokuapp.com/)

[Node documentation](https://nodejs.org/dist/latest-v14.x/docs/api/)

## Basic Theoretical stuffs

* Just a powerful version of javascript which can run as a process\
    in local machine and do the usual stuffs other programming languages do.
* Can be said server side javascript.
* Chrome's V8 javascript engine is used in creating node's javascript engine.
* V8 engine is written in c++

## Variables

* ```__dirname``` stores the full path of current directory
* ```__filename``` stores the full path of the current file

## Process object

```bash
process.exit()
   # exits from the node shell. (.exit works as well, the default object is process)
process.argv
    # stores the command line arguments in an array. -> argv=argumentsVector
    # the first two elements of the array is node and app's location
```

## Exporting

* Files loaded with ```require()``` does not share it's variable.
* Have to export specific variables/functions to make it available for others
* Trailing things not specified.

```javascript
module.exports = 'variable/function';
        // for exporting a single variable or a function
```

## Package-json file

```javascript
"scripts":{
        "start": "node src/app.js",
        "dev": "nodemon src/app.js -e js,hbs"
}
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
const fs=require('fs');
fs.writeFileSync('file_path', 'Buffer to be written on the file');
        // Creates a file and writes to it in synchronus way.
fs.appendFileSync('file_path', 'Buffer to append');
        // Appends the buffer in the specified file in synchronus way.
const dataBuffer = fs.readFileSync('file_path');
        // returns binary data from file
const dataJSON = dataBuffer.toString();
        //converts in json format if the file is formatted properly
```

### validator

[Validator Doc](https://www.npmjs.com/package/validator)

```javascript
//npm i validator     // installs the validator package
const validator = require('validator');
                    // returns a validator object
validator.isEmail('mail@email.ext');    // returns boolean
validator.isURL('https://url.ext');     // returns boolean
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
debugger 
// if put in a certain line, program stops at that line and then the other variables could be seen from the terminal.
```

```bash
node inspect file.js [other options] will start node debugger
```

In chrome, type ```chrome://inspect``` to inspect the files

## Asynchronus Nodejs

**Keywords:**
* Call Stack
* Node API
* Event Loop
* Callback Queue
  * Maintains a list of all the callback functions

```javascript
setTimeout(()={}, s) 
//execute the first function after s milliseconds
//here first parameter is a function
// time is in milliseconds
```

For asynchronus function, a funcion call doesn't wait for the task to be completed.\
Rather it registers an event-callback pair in NodeJS API. Callback is the function to be run.\
Thus the call stack gets to run other functions while the callback is being processed.\
*Asynchronus functions could not be pushed in the call stack by the event loop if it's not empty.*\
*Even the main function has to be removed from the stack.*\
*Meaning: Asynchronus functions run after all the synchronus functions has run*

### Callbacks

A function which is provided inside another function as an argument with an intention of calling it later on.

```javascript
//basic structure of a callback function
const asynchronusFunction = (parameter1, parmeter2, parmeterN, callback) => {
        //things to do with parameterObject
        callback(dataToReturn);
}

asynchronusFunction(paramter, parmeter2, parmeterN, (dataReturned)=>{
        //thing to do with the data returned from callback 
})
```

## HTTP Related methods

### ```http```

```javascript
const http = require('http'); //same goes for https

const request = http.request('url', (response) => {
       /* Event Handling*/ 
       let data = '';
       response.on("data", (bufferChunk)=>{
               data = data + chunk;
               //here response comes as a form of buffer, chunk by chunk
               //whenever a chunk of data is coming, we are saving it into the data variable
       })
       response.on("end", ()=>{
               const body = data.toString();
               // When all the bytes has successfully reached the destination
       })
       response.on("error", (error)={
               //do something with the error
       })
})


request.end(); //mandatory thing to do, otherwise will continue to listen for response
```

### ```request```

Request is an asynchronus function by default.

```javascript
const request = require('postman-request');
request({ url:url }, (error, response)=>{
        /*function to run when the response arrives*/
        console.log(response.body); // Stores the body of the response
});
//first parameter of reqest
firstparamObject= {url:url, json:true}
// json:true -> response json is parsed autometically

```

### ```encodeURIComponent```

```javascript
encodeURIComponent(data); //URL encodes the passed data 
```

## Express

[expressjs.com](https://expressjs.com/)

```javascript
const express = require("express");

const app = express();  // express returns this object with all the work to be done


//------------- General app syntax -----------------
app.set(name, value)
//-----------------

app.set("view engine", "template_engine_name"); //template_engine_name = hbs

                // for specifying which templating engine to use 


//------------- Express options----------------------------------------
app.use(express.static(full_path_to_web_content_directory))
        // for setting up the root directory of the server
app.use(express.json())
        // Parse the incoming json as javascript object

//----------Get Requests---------------------------------------------
app.get('/route/:routeParameter',async (req, res)=>{
        res.status(statusCode); // For setting up response status code
        // Have to send status code before sending response

        res.render('filename_without_extension_inside_views_folder', {object_with_key_value_pair});
        //for rendering dynamic html file from any templating engine
        //need to use some variables inside the template. The object passed stores the needed variables
        res.send("Things to pass as response to the request")   // For sending text as response
        
        const request_query = req.query; // req.query contains the get-request objects
        const request_parameters = req.params; // req.params contain route parameters
})


//----------Post Requests-----------------
app.post('/route',async (req, res)=>{
        data = req.body;      // Grab the incoming data with the post request
        
        res.status(statusCode)  // Status Code to send
        
        res.send('ResponseText');
});


//-----------Patch Requests---------------------------------
app.patch('route', async (req, res)=> {      
        //Patch requests are used to update existing data
});

//---------- Delete Requests ------------------------------------
app.delete('route', async (req, res)=>{
        //Delete requests are used to delete database entries
})

//--------------Server listen to specific port for incoming requests-----------------
app.listen(port_number, ()=>{
        console.log("Instructing the server to listen to port X for incoming");
});


//----------------- Express Routers -----------------------------------------
const router = express.Router()

router.get(route,(req, res)=>{  // Other http request types
        //route handler
})

```

## Templating

### ```handlebars for express -> hbs```

* Handlebar's template folders has to be kept inside a folder named 'views' in the root of the server
* Each template file has to have ```.hbs``` extension

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

* **REST:** Representational State Transfer
* **API:** Application Programming Interface

REST API allows clients to manipulate and access resources using a set of predefined operations.
* GET: Fetch Data
* POST: Write Data. Success: 201, Failed: 400(due to invalid input)
* PATCH: Update Data
* DELETE: Delete Data

![REST API Structure](Assets/restapistruct.png)

## Postman

* POST data to be inputted inside body tab of postman.