;Program to print a pyramid using nested loops
;Author: Nazib Abrar
;Date: 2 July, 2021
dosseg
.model small
.stack 100h
.data
.code
main proc
mov bx, 1
mov cx, 10
loop1:
    push cx
    mov cx, bx
    loop2:
        mov dl, '*'
        mov ah, 2
        int 21h
    loop loop2
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah, 2
    int 21h
    inc bx
    pop cx
loop loop1
mov ah,4ch
int 21h
main endp
end main