    global _my_asm
    section .text
_my_asm:    
;int myasm(int x, int y)
    push ebp
    mov ebp, esp    
    
    mov eax, [ebp+8]        ;reserved address for having the struct variables are loaded into eax
    mov byte [eax], 'A'   ;both could not be addresses/values at least one has to be register
    mov byte [eax+1], 'B'
    mov byte [eax+2], 'R'
    mov byte [eax+3], 'A'
    mov byte [eax+4], 'R'

    pop ebp
    ret