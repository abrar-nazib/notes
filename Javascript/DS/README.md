# Data Structures

Resources:

* [Glot](https://glot.io/)
* [Repl.it](https://replit.com/)

## Big O

**Resources:**
1. [BigOCheatSheet](https://www.bigocheatsheet.com/)

**Good Code:**\
Good code could be described in two points:
1. Readable
2. Scalable 
   1. Speed  (Time complexity)
   2. Memory (Space complexity)

Big o complexity chart:\
![Big o complexity chart](Codes_and_Assets/big_o.png)\
Simply put: When we grow big and big with our input, How much does our function/algorithm slow down.\
Runtime: How much time something takes to run.

### Different types of Big 0 notations

[Big O challanges](Codes_and_Assets/BigOchallange.js)\
[Big O Rules](Codes_and_Assets/BigORules.js)\
**Rules:**
1. Worst Case
   * Big O only cares about the worst case scenerio. 
2. Remove constants
   * Constants play an insignificant role while n gets largers. So we don't count them
3. Different terms for input{Trickiest part}
   * Different inputs will have different numbers
   * The thing with O(a+b) and O(a*b)
4. Drop non Dominants
    * Where complexity is O(n + n^2), n^2 is the dominant one. So complexity will be O(n^2)

**O(n):**\
O(n) -> Big O of n -> Linear Time\
The Big O depends on the number of inputs.\
For loops or while loops.\
![O(n)](Codes_and_Assets/o(n).png)\

**O(1):**\
O(1) -> Big O of 1 -> Constant time\
Does not depend on input size. Constant task.\
No loops\
![O(1)](Codes_and_Assets/O(1).png)\

**O(n^2):**\
O(n^2) -> Quadratic time.\
Number of operations increases exponentially with the input size\
Nested loops{one inside another -> two}\
![O(n^2)](Codes_and_Assets/O(n^2).png)\

**O(n!):**\
O(n!) -> Factorial time -> Oh no!\
Adding a nested loop for every single input

**Big O and algorithm:**\
![Big O Cheat Sheet](Codes_and_Assets/bigOCheatSheet.png)

### Space complexity

When a program executes, it has two ways to remember things. Heap and the stack.\
**Heap:** The variables we assign are stored here\
**Stack:** Where we keep track of our function calls.\
Space complexity elements:
1. Variables
2. Data structures
3. Function Calls
4. Allocations

## Coding problem solving skills

Companies are looking for:
1. Analytics Skills {How can you think through the problems and analyze them}
2. Coding skills  {Do you code well by writing simple, clean, organized, readable code}
3. Technical Skills  {Do you know the fundamentals of the job you are applying to}
4. Communication skills {Does your personality matches the company culture}

### **Needed Knowledge**

![Data Structure and Algorithms needed](Codes_and_Assets/ds&algo.png)

### Step By Step through a problem:

1. When the interviewer says the question, write down the key points at the top (i.e. sorted
array). Make sure you have all the details. Show how organized you are.
2. Make sure you double check: What are the inputs? What are the outputs?
3. What is the most important value of the problem? Do you have time, and space and memory,
etc.. What is the main goal?
4. Don't be annoying and ask too many questions.
5. Start with the naive/brute force approach. First thing that comes into mind. It shows that
you’re able to think well and critically (you don't need to write this code, just speak about it).
6. Tell them why this approach is not the best (i.e. O(n^2) or higher, not readable, etc...)
7. Walk through your approach, comment things and see where you may be able to break things.
Any repetition, bottlenecks like O(N^2), or unnecessary work? Did you use all the information
the interviewer gave you? Bottleneck is the part of the code with the biggest Big O. Focus on
that. Sometimes this occurs with repeated work as well.
8. Before you start coding, walk through your code and write down the steps you are going to
follow.
9. Modularize your code from the very beginning. Break up your code into beautiful small pieces
and add just comments if you need to.
10. Start actually writing your code now. Keep in mind that the more you prepare and understand
what you need to code, the better the whiteboard will go. So never start a whiteboard
interview not being sure of how things are going to work out. That is a recipe for disaster.
Keep in mind: A lot of interviews ask questions that you won’t be able to fully answer on time.
So think: What can I show in order to show that I can do this and I am better than other
coders. Break things up in Functions (if you can’t remember a method, just make up a function
and you will at least have it there. Write something, and start with the easy part.
11. Think about error checks and how you can break this code. Never make assumptions about the
input. Assume people are trying to break your code and that Darth Vader is using your
function. How will you safeguard it? Always check for false inputs that you don’t want. Here is
a trick: Comment in the code, the checks that you want to do... write the function, then tell the
interviewer that you would write tests now to make your function fail (but you won't need to
actually write the tests).
12. Don’t use bad/confusing names like i and j. Write code that reads well.
13. Test your code: Check for no params, 0, undefined, null, massive arrays, async code, etc... Ask
the interviewer if we can make assumption about the code. Can you make the answer return
an error? Poke holes into your solution. Are you repeating yourself?
14. Finally talk to the interviewer where you would improve the code. Does it work? Are there
different approaches? Is it readable? What would you google to improve? How can
performance be improved? Possibly: Ask the interviewer what was the most interesting
solution you have seen to this problem
15. If your interviewer is happy with the solution, the interview usually ends here. It is also
common that the interviewer asks you extension questions, such as how you would handle the
problem if the whole input is too large to fit into memory, or if the input arrives as a stream.
This is a common follow-up question at Google, where they care a lot about scale. The answer
is usually a divide-and-conquer approach — perform distributed processing of the data and only
read certain chunks of the input from disk into memory, write the output back to disk and
combine them later.

## Data Structures intro

**Resources:**
1. [List of all Data structures](https://en.wikipedia.org/wiki/List_of_data_structures)
2. 

Data structure: A collection of values having or not having relationships between them and functions applied to them.\
Variables are stored in RAM.\

### Operations on Data structures

1. Insertion
2. Deletion
3. Traversal{Access each data at least once so that it can be processed}
4. Searching
5. Sorting
6. Access

## Arrays

**Codes:** 
1. [Array_1.js](Codes_and_Assets/Array_1.js)

**Classifications:**
1. Static   {Fixed in size. Need to specify the size while declared}
2. Dynamic  {Tricky static array: Copies elements to a new bigger location when about to overflow. Usually doubles the space}

### Big Os of Array Functions

1. Lookup -> O(1) -> Constant time
2. Push -> O(1)   -> Constant time
   1. Append -> O(1) but could be O(n) {This section is for dynamic array}
3. Insert -> O(n) -> Linear time
4. Delete -> O(n) -> Linear time

### Methods

```javascript
array[2]             // O(1)
array.push('value'); //adds 'value' to the end of array
                     // O(1) operation
array.pop();         //removes the last item from the array
                     // O(1) operation
array.unshift('value')  //Adds 'value' to the beginning of the array
// O(n) Because have to iterate through all the indexes and reassign them again
array.splice(2, 0, 'value')
// first param: Starting index, Second Parameter: Delete count, Third parameter: element to be added
// Adds an element at the specified position.
//O(n) because needs to shift the rest of the elements                   
```



### Others

* Contiguous memory: Sequencial memory addresses.
* Arrays are actually objects with integer based keys.
* Strings are actually array of characters.