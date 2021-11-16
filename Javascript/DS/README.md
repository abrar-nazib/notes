# Data Structures

Resources:

* [Glot](https://glot.io/)
* [Repl.it](https://replit.com/)

## Big O

**Good Code:**\
Good code could be described in two points:
1. Readable
2. Scalable 

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
![O(n)](Codes_and_Assets/o(n).png)\

**O(1):**\
O(1) -> Big O of 1 -> Constant time\
Does not depend on input size\
![O(1)](Codes_and_Assets/O(1).png)\

**O(n^2):**\
O(n^2) -> Quadratic time.\
Number of operations increases exponentially with the input size\
![O(n^2)](Codes_and_Assets/O(n^2).png)
