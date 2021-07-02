;Program to reverse a string
;Author: Nazib Abrar
;Date: 2 July, 2021
dosseg
.model small
.stack 100h
.data
    string db 'Abrar$'

.code
main proc
    ;loading the address of the data segment inside data segment register
    mov ax, @data
    mov ds, ax
    
    ;Printing the existing string with a newline
    mov dx, offset string 
    mov ah, 9
    int 21h

    mov dl, 10
    mov ah, 2
    int 21h

    ;Loadint the string's address in source index register
    mov si, offset string

    ;loop to load the characters one by one in the stack
    mov cx, 5
    strload:
        mov bx,[si]
        push bx
        inc si
    loop strload

    ;loop to print the reversed string in the terminal
    mov cx, 5
    strprint:
        pop dx
        mov ah,2
        int 21h
    loop strprint

    ;terminating the terminal session
    mov ah,4ch
    int 21h


main endp   ;end process
end main    ;program end