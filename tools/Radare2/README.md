# Notes on Radare2

## Links

- [Talk slides](https://web.archive.org/web/20180312191821/http://www.radare.org/get/THC2018.pdf)
- [Cheat sheet 1](https://github.com/radareorg/radare2/blob/master/doc/intro.md)
- [Cheat sheet 2](https://gist.github.com/williballenthin/6857590dab3e2a6559d7)
- [At&t Syntax](https://flint.cs.yale.edu/cs421/papers/x86-asm/asm.html)

## Language Basics

**Memory Sizes**\
Byte - b - 1\
Word - w - 2\
Double Word - l- 4\
Quad Word - q - 8\
Single Precision - s - 4\
Double Precision - l - 8\
\
**Jump Types**\
jmp - unconditional jump\
je - jump if zero/equal\
jne - jump if not zero or equal\
js - jump if negative\
jns - jump if not negative\
jg - jump if greater than\
jge - jump if greater than or equal\
jl - jump if less than\
jle - jump if less than or equal\

## Basic Commands

- `r2 -d executable` Debug the executable file
  - `-d` for debug flag

## R2 commands after opening file

- `aa` It analyses all symbols and entry points in the executable.
  - `a` for analyze stuffs
  - `aaa` is normally used in most cases
- `afl` Show the list of the functions detected
- `e asm.syntax=att` to set disassembly syntax to at&t
  - `e` for evaluable variables
- `pdf @main` Disassembles main
  - `pdf` Print disassembly function

## Breakpoint

- `db 0xaddress` break at specified address
- `dc` Continue execution. Will start execution and stop at breakpoints.
- `dr registername` show general purpose registers
  - `dr` without any parameter shows all the registers
- `px @register` show hexdump
- `ds` seeks or moves onto the next instruction

## Command line options

- `-A` Equivalent to running aaa after entering the r2 console
- `-w` Open file in write mode

## Analyzing

- `aaa` Analyze everything
- `af` analyze functions
- `afl` list all the functions

## Information

- `ia` Shows all information about the current file.
- `izz` search the whole binary and show all the strings.
- `iM` shows the address of the main function if main function gets detected
- `ie` shows the entry point of the program

## Memory Inspection

- `s` Print current memory address
- `s addr` Seek to a specific address
- `s+ 5` seek 5 bytes forward
- `s- 12` seek 12 bytes backward
- `s-` undo the previous seek
- `sr rax` seek to the address of rax register

## Printing

- `@` is used to specify that something is an address in the memory.
- `px` Hexdump of current address
- `pd` disassembly of the current address
  - `pd f main` disassembles the main function

## Breakpoint Commands and register speculation

- `db address` sets a breakpoint
  - `dbi` list all breakpoint addresses
- `dr` shows all the registers
- `dc` continue execution until any breakpoint is hit
- `ds` Step through a single line
  - `ds 2` Step through 2 lines

## Visual mode

- Have to seek to the function to get visual of the function using `s functionname`
- `vV` will enter the command in visual graph mode
- `s/S` in visual mode to step over

## Write mode

- `w` to write to current memory address
- `wc` List all write changes
- `wa` Modifies instruction in current memory
