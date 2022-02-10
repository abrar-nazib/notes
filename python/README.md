# Learning Notes on python

## Script starting

```python
#!/usr/bin/env python3
```

## Variable type conversion

```python
int(variable)   # Converts variable to integer
```

## For Loop

```python
for i in range(6):
    print(i) # prints 0 to 6
for i in range(-6,6):
    print(i) # prints -6 to 5]
for i in range(-6, 6, 2):
    print(i) # prints -6 to 5 with step 2

# Decimal value increment
for i in numpy.arange(-6, 6, 0.1):
    print(i) # prints with 0.1 increment
for i in numpy.linespace(5, 1, 1):
    print(i)    # will start exactly at 5 and stop exactly at 1 with 1 step.
                # Intelligent enough to understand increment and decrement
```

## Hacks

```python
dir(object) # shows all the methods and attributes available to the object
help(object) # shows in detail documentation of the methods and attributes
```

### Ternary

```python
x=1 if condition else 0
# is equivalent to
if condition:
    x=1
else:
    x=0
```

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

list.remove(element)    # will remove the element fromt the list
```

## Dictionaries

```python
dictionary = {"key":"value"}
# Assignment
dictionary["key"] = "value"

```

## String and list Operations

- `r"string"` Python treats this type of strings as raw strings. `\t` is not interpreted as tab if `r` is used
- `string[::-1]` reverses the whole string
- `len(string)` shows the stirng size. Applicable for list as well
- `string.split(xx)` xx = character on which the string to split
- `f'formatted string with {variable} inside'`
- `'whattoputwhenseperated'.join(list)` will convert the list into a string

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

## CSV module

```python
import csv

# Write to a a file
csv_file = open('file.csv', 'w')
csv_writer = csv.writer(csv_file)
csv_writer.writerow(['headline1', 'headline2', 'headline3'])
csv_writer.writerow(['data1', 'data2', 'data3'])
csv_file.close()

fileObject = open('file.csv', 'r')
csv_dict_reader = csv.DictReader(fileObject)    # Will read the contents of the csv file as dictionary

```

## Regular Expression

[DebugRegex](https://www.debuggex.com/)

- MetaCharacters (Need to be escaped with a "\" ): `.[{()\^$|?*+`
- `. -` Any Character Except New Line
- `\d -` Digit (0-9)
- `\D -` Not a Digit (0-9)
- `\w -` Word Character (a-z, A-Z, 0-9, \_)
- `\W -` Not a Word Character
- `\s -` Whitespace (space, tab, newline)
- `\S -` Not Whitespace (space, tab, newline)
- `\b -` Word Boundary
- `\B -` Not a Word Boundary
- `^ -` Beginning of a String
- `$ -` End of a String
- `[] -` Matches Characters in brackets {No backslash escaping escaping inside this brackets}
- `[a-z]` `[1-9]` Range based matc
- `[^ ] -` Matches Characters NOT in brackets {Matches everything out of the set}
- `| -` Either Or
- `( ) -` Group -> `M(r|s|rs)` matches Ms, Mrs, Ms
- `() () ()-` $1, $2, $3 will hold the matches of the brackets sequentially
  **Quantifiers**:
- `* -` 0 or More
- `+ -` 1 or More
- `? -` 0 or One
- `{3} -` Exact Number -> `\d{3}` will look for three occurances of digits
- `{3,4} -` Range of Numbers (Minimum, Maximum)

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

#### Sample Regexs

`[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+` -> matches email addresses

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
finally:
    #this block will run regardless of the error or exception
```

## Threading Library

- Not multi processing(for CPU)
- Runs code Concurrently (Not parallely)
- I/O bound tasks can be multi threaded

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

- Use with context manager

- ThreadPoolExecutor

- List comprehention

- Map method in futures object?

- For I/O bound jobs (not CPU bound)

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

- `ctrl+b` build project
- `ctrl+shift+p` terminal/command pallete
- `ctrl+shift+k` toggle side directory tree

## Requests

[Python Request Module Doc](https://docs.python-requests.org/en/master/index.html)
[Http Request Bin](https://httpbin.org/)

```python
import requests
```

### Get Requests

```python
response = requests.get(url)
response = response.get(url, params = params)
    # params has to be a key-value pair (dictionary). They are URL parameters
```

### Post Requests

```python
response = requests.post(url)
response = requests.post(url, data = data, headers=headers, timeout=timeout, auth=('username', 'password'))
    # data = data to send to the server. Key-value pair
    # timeout = second stops waiting for the response to come
    # headers = headers adds custom headers to the request
    # auth = ('username', 'password') For basic http authentication
```

### Multipart-Encoded File Post

```python
files = {'file':('filename.ext', open('filename', 'rb'), 'application/filetype')}
    # application/filetype defines the file type
    # rb is for reading the file as binary object
response = requests.post(url, files=files)
```

### Response object

```python
byte_response = response.content
    # Response content in bytes. Good for image files

text_response = responese.text
    # Response content in unicode text

response_status_code = response.status_code # Response status code
    # 200+ -> success
    # 300+ -> redirects
    # 400+ -> client errors
    # 500+ -> server errors

response_ok = response.ok
    # Anything less than 400 will return true

response_headers = response.headers
    # Response headers

requested_url = response.url
    # The state of the request when it was done

response_json = response.json()
    # This method creates python dictionary from json string returned from response
```

## Requests-html

[Requests-html docs](https://docs.python-requests.org/projects/requests-html/en/stable/)

```python
from requests_html import HTML # For html parsing

source_text = response.text # might come from a .html file or a response
htmlobj = HTML(html=source_text)   # html is an HTML object
html_with_tags = htmlobj.html  # Will return the whole html with html tags
html_without_tags = htmlobj.text    # will return the whole html without html tags

# Selecting Tags
tag = html.find('tag_name') # THis will return a list.
    # tag[0].html returns the element with tag. tag[0].text returns only the element.
tag = html.find('tag_name', first=True) # will only return the first match. Not a list as default

# Selecting according to class and id

tag = html.find('tag_name.class_name')
tag = html.find('tag_name#id_name')

# Hiararcical selection
tag_inside_tag = html.find('parent_tag_name.class child_tag_name#id')

# Accessing Attributes
tag = obj.find('tag_name')
tag.attrs['attributename']
```

```python
from requests_html import HTMLSession # For getting data from url

session = HTMLSession()  # session is a HTMLSesssion object
response = session.get('http://coreyms.com')    # Similar to requests library
html_object = response.html     # returns an object
all_links_of_webpage = html_object.links # will gather all links of the website
all_absolute_links_of_webpate = html_object.absolute_links # Will gather all absolute links
```

**Grabbing Javascript Generated Text**

```python
html_object.render() # renders the javascript code
```

**Asynchronus Requests**

```python

```

## BeautifulSoup

```python
from bs4 import BeautifulSoup

soup = BeautifulSoup(htmlfile, 'parser')    # parser ex: lxml
    # Soup is a BeautifulSoup object of parsed html
prettied_html = soup.prettify() # Indent the html file correctly

# Accessing html tags
grab_tag = soup.tag_name    # will grab everything between the specified tag including the tag itself
grab_tag_element = soup.tag_name.text # will grab everything between the specified tag

# Accessing html tags by id, class, name
grabTag = soup.find("tag_name", class_="class_name")
        # Only class requires an _ (underscore) because it's reserved in pytohon
grabTag = soup.find("tag_name", id="id_name")

## Accessing all the tags
for element in find_all("tag_name", class_="class_name"):
    # Do whatever needed to do with each element
    # find_all() looks for all the matching tags

# Accessing tag attributes
    # Tag attributes could be accessed like dictionary elements
attribute = soup.find("tag_name", id="id_name")["attribute_name"]
```

## `vPython`

`pip3 install vpython`

```python
import vpython
# or from vpython import *

# Creating a sphere(3D round object)
myBall = vpython.sphere(color = color.colorName)  # color sets up the color for the sphere

# Creating a box
myBox = vpython.box(color = color.colorName, length= xAxisValue, width=zAxisValue, height = yAxisValue)

# Creating Cylinder
myCylinder = vpython.cylinder(color=color.colorName, length=xAxisValue, radius=radiusValue)
myEllipticalCylinder = vpython.cylinder(color.colorName, length=xAxisVAlue, width=zAxisValue, height=yAxisValue)

# Creating Arrow
myArrow = arrow(axis=vector(x,y,z), length=arrowLength, shaftWidth=arrowThickness)

# Shape Properties
shape.length = xAxisValue
shape.width = zAxisValue    # (inside the screen)
shape.height= yAxisValue

shape.size = vector(x, y, z) # height width and length

shape.radius= radiusValue # in circular objects
shape.pos = vector(x,y,z) # (0,0,0) is at the center of the screen

shape.color = vpython.color.ColorOfYourChoice
shape.color = vector(r, g, b)   # r, g, b range 0-1
shape.opacity = opacity     # Opacity is from 0-1. 0 means invisible, 1 means normal.

# Shape axis orientation
shape.axis = vector(x, y, z)    # x, y, z
                                # axis defining after initialization messes up the array location

# A mandatory while loop
while True:
    rate(60) # Define the frame rate
```

## **OOP**

- Data and Function associated with classes are called attributes and methods.

### Class

- Class is basically a blueprint to create instances.
- Each object created with a class is called instance of the class.
- Instance variables are unique to the instance.
- Class variables are shared among all instances of the class. Kinda like global variable for instances.

```python
class className:
    pass # if want to keep the class definition empty for the time being
obj = className()

class className:

    raise_percentange = 0.04    # this is a class variable
    classVariable = 1

    def __init__(self, first, last):
        # This is the constructor method
        self.first = first  # first is an attribute and an instance variable

    def exampleMethod(self):
        # This is a method

    def classVariableAccess(self):
        self.pay = self.pay * self.raise_amount

    @classmethod   # classmethod decorator alters the functionality of the method
    def exampleClassMethod(cls, otherparameters):
        # Need to take cls as the first argument
        cls.classVariable = otherParameter

    @classmethod
    def from_string(cls, parameters):
        # class methods as alternative constructors
        attr1, attr2, attr3 = parameters.split('-')
        return cls.(attr1, attr2, attr3)    # will return an object of the className

    @property
    def propertymethod(self):
        returnvar = self.variable1 + self.variable2 # variables get updated when changed
        return returnvar

    @propertymethod.setter
    def propertymethod(self, name):
        # for setting a propertymethod value

    @propertymethod.deleter
    def propertymethod(self):
        # Delete some elements


obj = className(first, second)
obj.exampleMethod()   # will execute exampleMethod
className.exampleMethod(obj)
    # Will execute the exampleMethod. Actually the method is to be run in exactly this way
print(className.__dict__)   # __dict__ shows the namespace of the class. Can show the instances as well
className.classVariable = someNewValue # will change the variable value for all the instances as well
objectName.classVariable = someNewValue # will only change the variable for this object. Others will be unmodified

className.exampleClassMethod(parameter)
    # will interact with the class method. Will pass the class itself as the first variable autometically
print(obj.propertymethod) # will whatever the print method returns. Don't need to use propertymethod().
del obj.propertymethod # will execute whatever is inside propertymethod
```

### Constructor **`__init__`**

```python
class exampleClass:

    def __init__(self, param1, param2, param3):
        # Things to do while instantiated

    def __init__(self, param1=defaultValue1, param2=defaultValue2):
        # Setting up default value while initiated

    def __init__(self, param1: str, param2: float):
        # Defining data type for parameters

    def __init__(self, parm1, param2, param3):
        assert param2 >= testvalue, f"Error message to send if assertion fails"  # assert is used for input validation
```

### Class Attributes and Instance Attributes

```python
class ExampleClass:
    classAttribute = value
    # Has to put in class scope before __init__

    def exampleMethod(self):
        self.property = somerandomfunction(ExampleClass.classAttribute)
        # This is how the classAttribute is accessed from inside a method.

exampleObject = ExampleClass()
print(ExampleClass.classAttribute)  # Class attributes could be accessed this way

ExampleClass.classAttribute = changedValue
    # changes the classAttribute for every instance
exampleObject.classAttribute = changedValue
    # changes classAttribute for only the perticular instance
```

### **`__repr__`**

- `__repr__` is used in representing an object while print is used on them

```python
    class ExampleClass:
        # Class definition and class attributes and methods

        def __repr__(self):
            # Repr is used for representing the class
            return f"ExampleClass({self.param1}, {self.param2}, {self.param3})"
```

### **`__dict__`**

```python
class ExampleClass:
    # Class Definiton and class attributes and methods

exampleObject = ExampleClass()

print(ExampleClass.__dict__) # will print all the attributes of the class.
print(exampleObject.__dict__) # will print all the attributes of the instance
```

### **Class Methods and Static Methods**

- A class method is a method which could only be accessed from class level only. Instances can not access them
- A class method is usually used as alternative constructor

```python
class ExampleClass:
    # Class definition and other code

    @classmethod # This decorator changes the behavior of the method
    def instantiate_from_file(cls, filename, otherParameter):
        # here the first parameter is the class itself. The class is passed autometically to the first parameter

```

```python
class ExampleClass:
    # Class definition and other code

    @staticmethod
    def exampleStaticMethod(normalParameter):   # Static methods do not require self

```

### Inheritance

```python
class ParentClass:
    # Parent Class definition

class ChildClass(ParentClass):
    def __init__(self, param1, param2, param3, param4): # param4 is specific to this instance
        super().__init__(param1, param2, param3)
        self.param4 = param4
```

### Magic Methods

**`__class__.__name__`**

```python
class ParentClass:
    # class definition
    def somerandomMethod(self):
        print(self.__class__.__name__)  # Will print the name of the class: ParentClass
class ChildClass:
    def somerandomMethod(self):
        print(self.__class__.__name__) # Will print the name of the class: ChildClass
```

## Decorators

## Closures

## First class functions

- A programming language is said to have first-class fiunctions if it treats functions as first class citizens.
- A first class citizen is an entity which supports all the operations generally available to other entities.
  - Being passed as argument
  - Returned from a function
  - Assigned to a variable
- Means, we should be able to treat functions like any other object or variable.9
