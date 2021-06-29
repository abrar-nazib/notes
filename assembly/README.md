# Notes on Assembly language

This language was designed by David John Wheeler
What is assembly language?\

1. A computer programming language
2. Low level language(close to the hardware)

Why learn Assembly?\

1. Better understanding of software and hardware interaction.
2. Optimization of processing time.
3. Embedded programming

## High level language convertion process

|                                       |           |
| ------------------------------------- | --------- |
| High Level Language (.c)              |           |
|                                       | Compiler  |
| Assemlby Code (.asm)                  |           |
|                                       | Assembler |
| Object File(.o){contains source code} |           |
|                                       | Linker    |
| Machine code                          |           |

Linker links the object files together and links the libraries(if necessary) and then converts itself to binary code.\
Assembly language reduces the process of compiling which makes itself faster

## Registers

What are registers?

1. Registers are memory cells built inside CPU.

**Diagram:**\

|           |     |       | CPU      |
| --------- | --- | ----- | -------- |
| Hard Disk | RAM | Cache | Register |

Closeness to the cpu decides the file transfer speed. Assembly language lets us to access the cpu registers.
