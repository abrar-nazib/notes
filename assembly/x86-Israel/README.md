# Assembly for modern x86 processors

## Evolution of intel processors

![evolution of intel processors](processor_evolution.jpg)

## x86 Data Types

1. **byte:** 8bit   -> 2^8-1
2. **word:** 16bit  -> 2^16-1
3. **dword:** 32bit (doubleword)    -> 2^32-1
4. **qword:** 64bit (quadword)  -> 2^64-1
   
## Memory models

![memory models](memory_models.jpg)

### Real-Address mode

Memory is divided into segments and offsets\
Program has three segments:
1. code (CS register holds the address of the code segment)
2. data (DS register holds the address of the data segment)
3. stack (SS register holds the address of the stack segment)

Addresses are dword/16 bit values

### Protected-Address Mode

4GB linear address space is available\
Program segments:
1. code (CS references to the code-segment descriptor table)
2. data (DS references to the data-segment descriptor table)
3. stack (SS references to the stack-segment descriptor table)

Protected addressing mode uses flat segmentation model
![flat segmentation](flat_segmentation.jpg)

## Operating modes of a x86 processor

1. Protected Mode
2. Real-Address Mode
3. System Management Mode
   
## x86 Registers

A register is a storage inside a processor core which could be accessed at much higher speed than conventional memory\
Registers in x86 processors:\
![x86 registers](x86_registers.jpg)
The index registers of 16 bit old registers are called Specalized registers here