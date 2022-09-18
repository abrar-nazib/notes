# JSDOC

Similar other documenting technologies:
1. JavaDoc
2. phpDocumentor

Comments beginning with ```/**``` or ```/***``` will be parsed for documentation. But comments with more than three stars will be ignored.

## JSDoc commands

```bash
jsdoc file.js   # Will create a directory named out/ in the current working directory and save the documentation there.
    -c <path_to_configuration_file>, --configure <__>   # Specify the path to a configuration file
    -d <path_to_output >
    -r, --recurse   # Recurse through subdirectories while searching for source files and tutorials
    -R, --readme    # Includes the readme file at the top of the documentation
    -t <template_path>, --template <__>  # To select the template directory
```
## JSDoc config

```json
{
  "plugins": ["plugins/markdown"],
  "recurseDepth": 10,
  "source": {
    "include": ["src"],
    "includePattern": ".js$",
    "excludePattern": "(node_modules/|docs)"
  },
  "templates": {
    "cleverLinks": true,
    "monospaceLinks": true
  },
  "opts": {
    "template": "./template",
    "destination": "./jsdoc/",
    "recurse": true,
    "tutorials": "./tutorials"
  }
}
```

## JSDoc tags

Here is a list of used JSDoc tags and their details:
1. ```@constructor``` Is used for defining a constructor.
2. ```@param {param_datatype} param_name - param_description``` Is used for describing a parameter of a function.
3. ```@class``` For class definition
4. ```@type {data_type}``` Is used for defining variables
   1. ```@type {Array<number>}``` means array with only number elements. 
5. ```@ts-check``` Is used for checking syntax according to the comment
