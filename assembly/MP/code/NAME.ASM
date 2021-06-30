;Program to print a name with characters
;Author: Nazib Abrar
;Date: 30 June, 2021
dosseg          ;manages the arrangement of the segments
.model small    ;data section <= 64KB and code section <= 64KB
.stack 100h     ;100 hexadecimal size for stack section
.data           ;data section
.code           ;code section
main proc       ;starting of main procedure
    mov dl,'A'  ;move character 'A' inside data register
    mov ah,2    ;move 2 to accumulator => print something on the screen
    int 21h     ;interrupt for showing on screen
    
    mov dl,'b'  ;move character 'b' inside data register
    mov ah,2    ;move 2 to accumulator => print something on the screen
    int 21h     ;interrupt for showing on screen
    
    mov dl,'r'  ;move character 'r' inside data register
    mov ah,2    ;move 2 to accumulator => print something on the screen
    int 21h     ;interrupt for showing on screen
    
    mov dl,'a'  ;move character 'a' inside data register
    mov ah,2    ;move 2 to accumulator => print something on the screen
    int 21h     ;interrupt for showing on screen
    
    mov dl,'r'  ;move character 'r' inside data register
    mov ah,2    ;move 2 to accumulator => print something on the screen
    int 21h     ;interrupt for showing on screen

    mov ah,4ch  ;exit accumulation session
    int 21h     ;interrupt for showing on screen
main endp       ;ending of main procedure
end main        ;Ending of the code section/whole program