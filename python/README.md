# Learning on python

## List

```python
my_list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#Index  =   0,  1,  2,  3,  4,  5,  6,  7,  8,  9
#Index  = -10, -9, -8, -7, -6, -5, -4, -3, -2, -1

## Extract certain range of elements form list

print(my_list[startIndex:endIndex:step])    
# if the endIndex is 7, the last element it will print is of the 6th index. It's called non-inclusive behavior
#[startIndex:endIndex] ->   default step is 1
#[startIndex:] ->   will print to the end of the list including the last element from the start Index
#[:endIndex]    ->  will print to the endIndex from the beginning
#[:]    ->  will print the whole array
#[::-1]     ->  reverse the whole list    
```

## String and list Operations

* ```r"string"``` Python treats this type of strings as raw strings. ```\t``` is not interpreted as tab if ```r``` is used
* ```string[::-1]``` reverses the whole string
* ```len(string)``` shows the stirng size. Applicable for list as well
## File Objects

```python
f = open(filename, 'x') # x=r/w/a, default is r. Read and write to a file -> r+. rb, wb for read and write binary files
f.close()   # Must close file otherwise cause security leaks and might run out of file descriptiors
```

Files are best handled with context managers. Context managers close files autometically after code block ends.\
Will close the file even the file throws an exception as well.

```python
with open(filename, 'r', encoding='enctype') as f: # f is the file variable, the encoding option is optional
    # Load the whole file at once
    f_content = f.read()    # f_content contains all the elements of the file f
                            # read could take integer input. Passing 100 to it loads first 100 characters
    # Load the whole file's lines in a list
    f_lines = f.readlines()
    # Load a line of the file
    f_line = f.readline()   # each time readline() is called, next line is read
    f.seek(characterPosition)   # sets the character position to read from
#--------Standard Procedure------------------------------------
with open(filename, 'r') as f:
    for line in f:
        print(line)
#---------Write Operations--------------------------------------
with open (filename, 'w') as f:
    # Basic File Writing
    f.write('content to write')
```


## Regular Expression

* MetaCharacters (Need to be escaped with a "\" ): ```.[{()\^$|?*+```
* ```.       -``` Any Character Except New Line
* ```\d      -``` Digit (0-9)
* ```\D      -``` Not a Digit (0-9)
* ```\w      -``` Word Character (a-z, A-Z, 0-9, _)
* ```\W      -``` Not a Word Character
* ```\s      -``` Whitespace (space, tab, newline)
* ```\S      -``` Not Whitespace (space, tab, newline)
* ```\b      -``` Word Boundary
* ```\B      -``` Not a Word Boundary
* ```^       -``` Beginning of a String
* ```$       -``` End of a String
* ```[]      -``` Matches Characters in brackets {No backslash escaping escaping inside this brackets}
* ```[a-z]``` ```[1-9]``` Range based matc
* ```[^ ]    -``` Matches Characters NOT in brackets {Matches everything out of the set}
* ```|       -``` Either Or
* ```( )     -``` Group -> ```M(r|s|rs)``` matches Ms, Mrs, Ms
* ```() () ()-``` $1, $2, $3 will hold the matches of the brackets sequentially
**Quantifiers**:
* ```*       -``` 0 or More
* ```+       -``` 1 or More
* ```?       -``` 0 or One
* ```{3}     -``` Exact Number -> ```\d{3}``` will look for three occurances of digits
* ```{3,4}   -``` Range of Numbers (Minimum, Maximum)

```python
pattern = re.compile(r'pattern', re.FLAG)  #Will seperate the pattern as a variable
    # FLAG = I[GNORECASE] ; for ignoring cases
match = pattern.match(searchText) # will search for only one match. Case sensitive
match = pattern.search(searchText) # will print the first instance of the match
matches = pattern.findall(searchText)   # will return according to the groups
matches = pattern.finditer(searchText)  #Will store all the matches inside a list
for match in matches:
    print(match)

specific_match = match.group(group_number) #will show the group numbers
                # group 0 stores the entire matc
# ------------- Substitute
pattern.sub(r'\2\3', textToSub)
```


#### Sample Regexs ####

```[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+```  -> matches email addresses

## Error Handling

```python
try
    pass
    #code block
except ExceptionOrErrorName:
    #specific errorHandlerCode
except ExceptionName as e:
    print(e)
    #Grab the error message
except Exception:   # could use 'as e' here as well
    #Generalized error handling
else:
    #Things to do if try block does not raise exception
```

## Threading Library

* Not multi processing(for CPU)
* Runs code Concurrently (Not parallely)
* I/O bound tasks can be multi threaded

```Python
import threading
t = threading.Thread(target=target_function, args=[arg1, arg2])
    # creates a thread object.
    # target is function name. Not a function call
    # args takes an array of arguments for target function
t.start()
    # invokes the object's target function and proceeds to next line
t.join()
    # waits for the execution to end
```

## Time module

```Python
import time
start = time.perf_counter()
    # starts a time counter(timestamp?)
time.sleep(arg)
    # arg -> integer as second

```

## Print function

```Python
print(f'Can be used {ES6 alike code space in python} Here')

```

## List Appending

```Python
list.append(object)
```

## Multiprocessing Module

```Python
process = multiprocessing.Process(target=function, args=args)
    # Creates a Process object -> target is the function to run
process.start()
    # Kicks off the process
process.join()
    # grabs the process output then does something else

```

## Concurrent.Futures Module

### ThreadPoolExecutor

* Use with context manager

* ThreadPoolExecutor

* List comprehention

* Map method in futures object?

* For I/O bound jobs (not CPU bound)

```Python
import concurrent.futures
with concurrent.futures.ThreadPoolExecutor() as executor:
    f = executor.submit(input_function, function_argument)
        # schedules the function to be executed
        # executor.submit returns a 'future' object

    f.result()
        # returns the function's return

    objects = [executor.submit(function, argument) for _ in range(times)]
        # List comprehension example in making 'future' objects
        #
    for f in concurrent.futures.as_completed(objects):
        # as_completed() yields the completed results
        print(f.result())
        #
        #
    iterate = [1,2,3,4,5]
    results = executor.map(function, iterate)
        # here executor.map will return result objects(in invoketion sequence)
        # .submit() returned a future object
        # map will run function with all the values of iterate as arg

```

### ProcessPoolExecutor

```Python
import concurrent.futures
with concurrent.futures.ProcessPoolExecutor() as executor:
    process = executor.submit(input_function, function_argument)
        # schedules the function to be executed
        # executor.submit returns a 'future' object

    process.result()
        # returns the function's return

    objects = [executor.submit(function, argument) for _ in range(times)]
        # List comprehension example in making 'future' objects
        #
    for process in concurrent.futures.as_completed(objects):
        # as_completed() yields the completed results
        print(process.result())
        #
        #
    iterate = [1,2,3,4,5]
    results = executor.map(function, iterate)
        # here executor.map will return result objects(in invoketion sequence)
        # .submit() returned a future object
        # map will run function with all the values of iterate as arg

```

## With Syntax(Context Manager)

```Python
with concurrent.futures.ThreadPoolExecutor() as executor:
    # do the works needed to do with all the execute(s)
```

## List comprehention

```Python
results = [execute_this(arguments) for _ in range(times)]
    # basic example
list=[1,2,3,4,5]
results = [execute_this(li) for li in list]
    # executes the function with each element of list
    # and puts the return value as an element inside results list
```

## Map

## PIL module

### Image

```Python
from PIL import Image
    #imports image
image = Image.open(image_name)
    #returns an image object 
image.filter(ImageFilter.GussianBlur(int))
    #Filter function of image object
    #associated with ImageFilter Function
image.thumbnail(size)
    #sets the image size
    #size is a touple (value, value)
image.save(path)
    #saves the image in the specified path
```

### ImageFilter

```Python
from PIL import ImageFilter
ImageFilter.GussianBlur(int)
    #ads gussianblur filter
```

## Joining Two Lists

```Python
list1 = [1,2,3]
list2 = [4,5,6]
list = list1+list2
```

## HEX encoding

### codecs.encode()

```Python
import codecs
codecs.encode(b"string_to_convert", "hex")
    #returns hex encoded string
codecs.encode(b"string_to_convert", "hex").decode("utf-8")
```

## Converting string to byte object

```Python
bytes(string, "string-type:utf-8")
```

## Checking a dictionary key's existance

```Python
dict.has_key(keyname)
    #returns bool
```

## Sublime Text configs and stuffs

[Themes Customization doc](https://www.sublimetext.com/docs/themes.html)

* ```ctrl+b``` build project
* ```ctrl+shift+p``` terminal/command pallete
* ```ctrl+shift+k