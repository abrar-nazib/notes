;Program to connect c with assembly
;Author: Nazib Abrar
;Date: 5 July, 2021

    global _my_asm        ;making this external/available to other people

    section .text
_my_asm:
;moving the value to the eax register because c expects the functions to return the value inside the eax register
    ;mov eax, 10         
    push ebp     ;pushing the base pointer
                 ;bp is used to use the stack pointer without modifying the stack pointer
    mov ebp, esp  ;move the stack pointer value(address) inside base pointer

    mov eax, [ebp+8]    ;accessing the passed variable
    add eax, [ebp+12]
    pop ebp      ;retrieving the base pointer
    ret 
