# Notes on Assembly language

This language was designed by David John Wheeler
What is assembly language?\

1. A computer programming language
2. Low level language(close to the hardware)

Why learn Assembly?\

1. Better understanding of software and hardware interaction.
2. Optimization of processing time.
3. Embedded programming

**Useful Links:**\
[Complete 8086 instruction set](https://www.gabrielececchetti.it/Teaching/CalcolatoriElettronici/Docs/i8086_instruction_set.pdf)

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

Registers:Record or collection of information.\
What are registers?

1. Registers are memory cells built inside CPU.
2. Fastest storage area/location
3. Quickly accessible by CPU as these guys are built inside CPU

**Diagram:**

|           |     |       | CPU      |
| --------- | --- | ----- | -------- |
| Hard Disk | RAM | Cache | Register |

Closeness to the cpu decides the file transfer speed. Assembly language lets us to access the cpu registers.

### Types of registers

There are 14 types registers inside a CPU:

![Types of Registers](images/types_of_registers.png)

## Segmentation

```assembly
mov [0xff], 0x30
;this instruction moves hex 30 to address hex ff but based on data segment 
```

**Finding Physical value:** Multiply the data segment value with 16 and then add the offset value

## Addressing Modes, MOV instruction, Service routine, ASCII code, Interrupt

**Mov:**\
Mov instructions can't copy immediate values inside segment registers
![instruction_interrupt](images/instruction_interrupt.png)
**Correction**\
a=97 and b=98\
INT 10H is for graphics\
Carriage return is the code of "Enter Key"

## Program structure, Syntax, Program to print a single character on screen

![understanding program structure](images/understanding_program_structure.png)

## Dosbox commands

1. Edit filename.asm
2. MASM filename.asm; => semicolon for not showing the log in the screen
3. LINK filename.obj;
4. filename.exe

## Character input

```assembly
    mov ah,1    ;moving 1 in accumulator means input will be saved in al portion of the register
    int 21h

    mov dl,al   ;register addressing -> moving the inputted value inside data register
```

## ADD operation

```assembly
    mov bl,2    ;moving values to a general purpose registers
    mov cl,3

    add bl,cl   ;here, bl is the destination register and cl is the source register
                ;cl won't change its value, but bl will hold the result of addition of the bl,cl
    add bl,48   ;ASCII 0=48, bl+48 will generate the ascii value of the result and put it into bl

    mov dl,bl   ;moving the answer to data register
```

## SUB operation

```assembly
    mov bl,9    ;moving values to a general purpose registers
    mov cl,1
    sub bl,cl   ;here, bl is the destination register and cl is the source register
```

## Variables

![variables](images/variables.png)

## Strings

```assembly
    mov ax,@data            ;moving address of data segment in accumulator ax(16 bit)
    mov ds,ax               ;moving ax inside data segment register => initiallizes a heap memory

    ;mov dx,offset msg1      ;moving string address into dx(16 bit){addresses are in 16 bit}
    lea dx,msg1             ;load effective address dx to msg1
```

Printing strings in 8086 processors has another syntax

```assembly
message: db, 'An innocent string', 0
mov si, message
lodsb
```

```lodsb``` stores the value of the first byte the ```si``` register pointing to inside al. Then it increments the value of the si

## Loop, Label, Counter Register, Inc, Program to print 0 to 1

![loops](images/loop.png)

```assembly
    mov cx,26       ;Setting the counter register
    mov dx,65
    loopingLabel:
        mov ah,2
        int 21h

        add dx,1    ;incrementing the dx register value
        ;inc dx     ;increments dx by 1
    loop loopingLabel
```

## Flag Register Carry parity Auxiliary zero sign trap interrupt direction and overflow flag

![flag registers](images/flag_registers.png)
**How Interrupts work:**\
When we call an interrupt, the CPU is gonna stop running the program, run some code(usually bios code) and then will get back to the main program.\
There are 256 interrupts. Locate memory viewer to 0x00:0x00 to look up the binary data into them. The first two bytes are segment, second two bytes are the offset.\
These are the memory addresses where certain codes are located. While interrupt is called CPU goes to that certain address and executes that code and then comes back to the program.\
8086 processors allow interrupt modification, but modern processors will eventually yell at you if you attempted to do so.\
Specially in the protected mode.\
**Important Flags:**\
JE/JZ(jump if zero/equal) checks whether the ZF or zero flag is set to 1\
JNE(jump if not equal) checks whether the ZF or zero flag is set to 0 or not\
JA(jump if above) checks whether the CF=0 and ZF=0\
JB(jump if below) checks whether the CF=1
JAE(jump if above or equal)
JBE(jump if below or equal)

## Jump

Unconditional Jump. Transfers control to another part of the program.\
Sets the value of IP register which controls the program execution flow.\
In detail, IP register will normally increment from the beginning address of the program while holding the current line number.\
JMP instruction just changes the line number to be executed.\
![jump](images/jump.png)

## Array

![array](images/array.png)

## Push and Pop, Stack

![stack](images/stack.png)

## Nested loops

![nested_loop](images/nested_loop.png)

## Procedure

![process](images/process.png)

## Macro

Macro has to be defined before the main code\
![macro](images/macro.png)

## Signed and unsigned number

![signed_unsigned](images/signed_unsigned.png)

## Signed Division

![signed_division](images/signed_division.png)
**Correction:**\
Quotient goes inside al and remainder goes inside ah

## Multiplication

![multiplication](images/multiplication.png)

## Graphics in assembly

![graphics](images/graphics.png)
![graphics](images/graphics2.png)

## Talking with hardware

```assembly
out port, data_register
in data_register, port
```

## Commands

```bash
nasm -fwin32 file.asm #inside windows to make object files
gcc file.obj # will link the object file with all standard libraries
gcc file.obj main.c -o main # will make an executable named main from file.obj and main.c
gcc main.c -o main.asm -S   # S flag means no executable, just assembly code
gcc main.c -o main.asm -S -O0  # O0 flag means no optimization in the assembly code

```

## Handling structs

C normally expects the struct's integer/dword variables to be returned inside eax register and char variables inside ebx registers.\
As long as they're less than 16 byte in size, it follows the normal process of returning them inside registers.\
Ebx register is 32 bit long. It can handle 4 bytes or 4 characters.\
If the structure's big enough to return inside registers, it's gonna push a memory address in the stack.\
That memory address could be used to store the variables inside that memory.

## Handling pointers
