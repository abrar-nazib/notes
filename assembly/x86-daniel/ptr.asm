    global _my_asm
    section .text

_my_asm:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]    ;moving the pointer/memory address inside eax
    mov dword[eax], 40  ;modifying the value of memory address eax


    pop ebp