# C and C++ compiler commands

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



