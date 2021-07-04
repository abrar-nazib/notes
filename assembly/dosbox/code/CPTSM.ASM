;Program to convert capital to small
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

    mov dl,10

    mov ah,2
    int 21h

    mov dl,bl
    add dl,32

    mov ah,2
    int 21h

    mov ah,4ch
    int 21h
main endp
end main