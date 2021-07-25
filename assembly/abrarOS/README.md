# abrarOS Learnings for future use

**Important link:** [Robert Brown's Interrupt list](http://ctyme.com/rbrown.htm)

## The BIOS

The Bios is almost a kernel in itself.

1. The CPU executes instructions directly from BIOS's ROM.
2. The BIOS generally loads itself into the RAM.
3. The BIOS will initialize essential hardware.
4. BIOS looks all storage medium for boot loader. It searches for the boot signature 0x55AA
    The 511th and 512th byte should contain a boot signature.
5. If it finds that signature, it will load the sector into the 0x7C00 section of the memory and start execution process from there.

## The BIOS parameter Block

[Bios Parameter Block Wiki](https://wiki.osdev.org/FAT)\
Some BIOSs write data in the first 33 bytes. So better not to put any code there. It's safe to fill them with zeros

## The Boot Loader

The Boot Loader is a small program responsible for loading the kernel of an operating system.\
In Real Mode(Real mode is a compatibility mode), Boot loader is given only 1MB of memory. It also runs on 16 bit code.\
MB is not so much space to do anything. So, boot loader's responsibility is to put into protected mode.\
Protected mode has access to 4GB of memory.\
**In Short:** Boot Loader's job is to put the kernel into the memory. Switches the processor into 32 bit protected mode. Then executing the kernel.

## The Boot System

1. BIOS is executed directly from the ROM
2. The BIOS loads the boot loader into address 0x7C00
3. The Boot loader loads the kernel
4. The kernel loads the essential pieces of the operating system

## The Real mode

1. Real mode is a compatibility mode which is started when all intel processors are switched on
2. In Real mode, only 1MB of memory could be accessed.
3. There is no security in real mode. No security for memory or hardware
4. In this mode, Memory is accessed through segmentation memory model
5. All code should be made in 16 bit architecture style

## NASM commands

**```nasm -f bin ./boot.asm -o ./boot.bin```**\
```-f bin``` means we are assembling to headless binary file(no object file in the middle-> object files has headers)\
**```ndisasm ./file.bin```**\
disassembles a binary file

## QEMU commands

**```qumu-system-x86_64 -hda file.bin```**\
```-hda``` for specifying the hard drive\

## Segmentation memory model

1. Memory is accessed by a segment and an offset
2. Multiple segments are available through the use of segment registers
3. The segment registers:\
    ```CS``` -> code segment register\
    ```SS``` -> stack segment register\
    ```DS``` -> data segment register\
    ```ES``` -> extra segment

**Calculation of actual memory from segmentation model:** Multiply te segment by 16 and then add the offset with it

