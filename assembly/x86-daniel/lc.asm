    global _my_asm
    section .text
_my_asm:    
;int myasm(int x, int y)
    push ebp
    mov ebp, esp    
    ;------------Starting of stack frame--------------------
    ;{
    sub esp, 8  ;allocating 8 bytes for the stack frame as we'll work with two integer variables

    ;int a = input[0]
    mov eax, dword[ebp+8]
    mov dword[ebp-4], eax

    ;int b = intput[1]
    mov eax, dword[ebp+12]        
    mov dword[ebp-8], eax    
    
    ;return a+b
    mov eax, [ebp-4]
    add eax, [ebp-8]
    
    add esp, 8
    ;}
    ;------------Ending of stack frame-----------------------
    pop ebp
    ret