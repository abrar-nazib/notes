# Notes on nodejs

[Node documentation](https://nodejs.org/dist/latest-v14.x/docs/api/)

## Basic Theoretical stuffs

* Just a powerful version of javascript which can run as a process\
    in local machine and do the usual stuffs other programming languages do.
* Can be said server side javascript.
* Chrome's V8 javascript engine is used in creating node's javascript engine.
* V8 engine is written in c++

## Elementary level commands

```bash
node filename.js        # runs the codes in file.
process.exit()
                        # exits from the node shell. (.exit works as well, the default object is process)
```

## File system

```javascript
const fs=require('fs');
fs.writeFileSync('file_path');
```
