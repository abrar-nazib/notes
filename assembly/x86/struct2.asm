    global _my_asm
    section .text
_my_asm:    
;int myasm(int x, int y)
    push ebp
    mov ebp, esp    
    
    mov eax, [ebp+8]

    pop ebp
    ret