# Rough sheet

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