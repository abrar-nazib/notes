# Notes on assembly language

## Structure of a computer memory

---

## CPU workflow

---

Works in fetch-execute-cycle\
Contains:

1. Program counter
1. Instruction decoder
1. Data bus
1. General Purlpose Registers
1. Arithmatic and logic units

Program counter holds the memory address of the next instruction.\
Instruction decoder decodes the instruction.\
Data bus is a connection between CPU and memory.\
General purpose registers are High speed memories of the CPU. Used for main action purposes\

## Data Accessing Methods

## Important Commands

```bash
as file.s -o file.o # puts the assembled output(object file) in file.o
ld file.o -o file # linker to output the new program in file

```

## Sections

.section .data\
Section for memory storage management\
.section .text\
Section for program instructions -> CPU will do\
