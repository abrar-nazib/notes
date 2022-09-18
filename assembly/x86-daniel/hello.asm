;Program to print hello world in the console
;Author: Nazib Abrar
;Date: 5 July, 2021

global _main        ;making this external/available to other people
extern _printf      ;there is a printf label somewhere, we don't know yet, we're gonna access it at the link time
                     
section .text       ;everything after here is code

_main:
    ;printf("Hello World")
    push message    ;pushing address of message inside stack
    call _printf    ;calling printf subroutine
    add esp, 4      ;adding 4 to the stack pointer, basically taking our message off the stack
                    ;stack was holding an address which is a word type and in x86 processors, word is 4bytes
    ret

message:            ;it should be inside data section but for the first time, breaking some rules
    db 'Hello World', 10, 0