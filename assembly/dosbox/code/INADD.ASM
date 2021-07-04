;Program to get two numbers from user and outputting the addition
;Author: Nazib Abrar
;Date: 20 Jun, 2021
dosseg
.model small
.stack 100h
.data
.code
main proc
    mov ah,1
    int 21h
    
    mov bl,al
    sub bl,48
    
    mov ah,1
    int 21h
    
    add bl,al

    mov dl,bl

    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
main endp
end main