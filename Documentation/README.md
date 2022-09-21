# Documenting Code

## JSdocs

### Installation and Getting Started

```bash
npm install jsdoc
npm install -D jsdoc # It's better idea to create docs as dev dependency
```

- Need to create a `jsdoc.json` file in the root directory

```json
{
  "source": {
    "include": ["src"], // Folders to include
    "includePattern": ".js$", // .js at the end of files will be parsed
    "excludePattern": "(node_modules/|docs)" // Won't parse anything in this pattern
  },
  "plugins": ["plugins/markdown"], // Used Plugins
  "templates": {
    "cleverLinks": true, // Link parsing option
    "monospaceLinks": true // Link parsing option
  },
  "opts": {
    "recurse": true, // Will search the directory recursively
    "destination": "./docs/", // Will store the output file here
    "template": "path/to/custom/template" // For storing custom templates
  }
}
```

- need to put a script in `package.json` file to create documentation

```json
"doc": "jsdoc -c jsdoc.json" // -cREATE documentation according to the configuration file specified
```

```bash
npm run doc # to run the documentation
```

### Typescript Validation

```javascript
// @ts-check
```

This enables checking types

### Custom Template

- add `"template": "path/to/custom/template"` in the jsdoc.json
- Edit the publish.js file

**Third Party Custom Theme**

```bash
npm install clean-jsdoc-theme --save-dev
```

```json
"opts": {
  "template": "node_modules/clean-jsdoc-theme"
}
```

### Variables

```javascript
/**
 * Variable Description
 * @type {variableType}
 */
const variable = "stringtypevariable";
```

- Variables could be typed `String`, `Number`, `object`

### Arrays

```javascript
/**
 * Array Description
 * @type {Array}
 */
const array = [elem1, elem2, elem3];

// @type {Array<variabletype>} for type defined array
```

### Objects

```javascript
/**
 * Object Type Variable
 * @type {{prop1: variableType1, prop2: variableType2}}
 */
const todo = {
  prop1: variableType1,
  prop2: variableType2,
};

// @type {{ prop1: variableType1|variableType2}} for a property with flexible variables
```

### Functions

```javascript
/**
 * A function that calculates tax
 * @param {Number} amount - Income Amount
 * @param {Number} taxPercent - Percentange of Tax
 * @returns {String} Total amount with added tax
 */
const calculateTax = (amount, taxPercent) => {
  return `$${amount + amount * taxPercent}`;
};
```

### Custom Types

```javascript
/**
 * A Student
 * @typedef {Object} Student
 * @property {Number} id - Student's ID
 * @property {String} name - Student's Name
 * @property {Number|String} [age] - Student's Age (Optional)
 * @property {Boolean} isActive - If the Student is active
 */

/**
 * Student Object
 * @type {Student}
 */
const student = {
  id: 1,
  name: "John Doe",
  isActive: true,
};
```

### Classes

```javascript
/**
 * Class for creating person object
 */
class Person {
  /**
   * Constructor for person class
   * @param {Object} personInfo Object containing info of a person
   */
  constructor(personInfo) {
    /**
     * @property {String} name Name of the person
     */
    this.name = personInfo.name;

    /**
     * @property {String} age Age of that person
     */
    this.age = personInfo.age;
  }

  /**
   * @property {Function} greet Greets with the name and age of the person
   * @returns {void}
   */
  greet() {
    console.log(`Hello ${this.name}! Your age is ${this.age}`);
  }
}
```

### Links

Provides link to the

```javascript
/**
 * See {@link Class}
 */
const object = new Class(parameters);
```

### Modules

On the top of the module file

```javascript
/**
 * Calculator Module
 * @module calculator
 */
```

### README

Have to write a README.md File and show the path to that file

```json

"opts":{
  "readme": "Path/To/README.md"
}
```
