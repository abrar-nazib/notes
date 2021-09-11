# Notes on nodejs

[Node documentation](https://nodejs.org/dist/latest-v14.x/docs/api/)

## Basic Theoretical stuffs

* Just a powerful version of javascript which can run as a process\
    in local machine and do the usual stuffs other programming languages do.
* Can be said server side javascript.
* Chrome's V8 javascript engine is used in creating node's javascript engine.
* V8 engine is written in c++

## Process object

```bash
process.exit()
   # exits from the node shell. (.exit works as well, the default object is process)
process.argv
    # stores the command line arguments in an array. -> argv=argumentsVector
    # the first two elements of the array is node and app's location
```

### Command Line arguments


## File system

```javascript
const fs=require('fs');
fs.writeFileSync('file_path', 'Buffer to be written on the file');
        # Creates a file and writes to it in synchronus way.
fs.appendFileSync('file_path', 'Buffer to append');
        # Appends the buffer in the specified file in synchronus way.
```

## Exporting

* Files loaded with ```require()``` does not share it's variable.
* Have to export specific variables/functions to make it available for others
* Trailing things not specified.

```javascript
module.exports = variable/function
        # for exporting a single variable or a function
```

## Package-json file

```json
json string
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
npm i package_name@version # installs the specific package
sudo npm -g i package_name       # installs the package in global scope
```

### validator

```javascript
npm i validator     # installs the validator package
const validator = require('validator');
                    # returns a validator object
validator.isEmail('mail@email.ext');    # returns boolean
validator.isURL('https://url.ext');     # returns boolean
```

### chalk

```javascript
npm i chalk     # installation
    ########Have to use it inside console.log####################################
chalk.color("text") # color=blue,green,yellow,black,etc
chalk.bgColor("text") # bgColor=bgBlack, bgRed, bgGreen, etc
chalk.modifiers("text") # modifiers=bold,italic,strikethrough
chalk.color.bgColor.modifiers("text") # multiple options could be used, no serial
```

### nodemon

```javascript
npm i nodemon -g    # installation

nodemon app.js      # runs app.js and updates with each save
```

### yargs

```javascript
yargs.argv      # returns the command line arguments array
yargs.parse()   # parses all the argv commands
                # if not called, don't print anything in the entire code.
node file.js --argument="value"
            # yargs stores this type of arguments in key-value pair
node file.js valuelessArgument1 argument2
            # yargs stores this type of arguments in another array
node file.js --help
            # yargs shows a help menu
yargs.version('1.2.1')
            # specify the version while --version is inputted
yargs.command({
        command:commandKey',
        describe: 'What this command does',
        builder:{
                title:{
                        describe: 'Builder option description',
                        demandOption: true, //makes this option mandatory
                        type: 'expected input type', //string, array, etc
                    }
            },
        handler: function(){
                //handlerCode
            }
    })
```
