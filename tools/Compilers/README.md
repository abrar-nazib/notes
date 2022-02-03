# Notes on Gcc Compiler and Makefiles

N.B: This is the thing which frustrates me the most. Need a cheat sheet of this shit.

## g++

```bash
g++ file.cpp #compiles the file.cpp and creates a *.out file -> executable
g++ file1.cpp file2.cpp #compiles the files to a single *.out file
g++ -c file1.cpp file2.cpp #creates  object files file1.o file2.o
g++ file1.o file2.o #compiles the object files
g++ -std=c++11 -02 -Wall test.cpp -o test #follows c++ 11 standards -02 optimizes the code -Wall shows the errors
```

## gcc

- `gcc -c [options] [sourcefiles]`
  - Compiles source files without linking
- `gcc -fPIC [options] [source files] [object files] -o output file`
  - Generates position independant code for shared libraries
- `gcc -Wall [options] [source files] [object files] [-o output file]`
  - Enables all compiler's warning messages
- ` gcc [options] [source files] [object files] [-Ldir] -llibname [-o outfile]`
  - `gcc -l` links with a library file.
  - `gcc -L` looks in directory for library files.
- `gcc -S [source files]` Does not assemble the file. Outputs as assembly code

## GDB commands

```bash
g++ -g file_mame.cpp # must compile with -g for debugging
gdb executable_file #starts a debugger session
b function_name #setting a breaking point on a function
b line_number #setting a breakpoint on line
n #goes to next line -> next
s #goes inside the function call -> step
f # where the fuck am I?
backtrace #on which function you are now and the pathway to this function
info b #shows the numbers of breakpoints in your code
info locals #shows the state of all local variables
delete 1 #delets the breakpoint 1
f frame_number #frame number is the function number from backtrace
```

## Makefiles

```makefile
file_to_be_made: from_which_file1 from_which_file2
    command to create file_to_be_made
```
