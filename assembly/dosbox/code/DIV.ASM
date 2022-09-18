;Program to test div insytruction
;Author: Nazib Abrar
;Date: 3 July, 2021
printdata macro dat
    mov dx, dat
    add dx, 48
    mov ah, 2
    int 21h
endm

newline macro
    mov dl, 10
    mov ah, 2
    int 21h
endm

dosseg
.model small
.stack 100h
.data
    quotient dw ?
    remainder dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 27
    mov dx, 0
    mov bx, 5
    div bx

    
    mov quotient, ax
    mov remainder, dx

    printdata quotient
    newline
    printdata remainder
    

    mov ah, 4ch
    int 21h

main endp
end main