;Program to use push and pop directive to swap two variables
;Author: Nazib Abrar
;Date: 2 July, 2021
dosseg
.model small
.stack 100h
.data
.code
main proc
    ;storing the values in two general purpose register
    mov ax, 5
    mov bx, 7

    ;pushing the value stored in ax register in stack then pushing the value of bx as well
    push ax
    push bx
    ;storing the topmost value of the stack inside ax register
    pop ax
    ;storing the topmost value of the stack inside bx register
    pop bx

    ;printing the values and then terminating the terminal session
    mov dx, ax
    add dx, 48
    mov ah, 2
    int 21h

    mov dl, 10
    mov ah, 2
    int 21h

    mov dx, bx
    add dx, 48
    mov ah, 2
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main