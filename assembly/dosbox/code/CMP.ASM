;Program to check whether the inputted number is equal or not
;Author: Nazib Abrar
;Date: 1 July, 2021
dosseg
.model small
.stack 100h
.data
    msg1 db 'inputted number is equal$'
    msg2 db 'inputted number is not equal$'
.code
main proc
    mov ax,@data
    mov ds,ax

    mov dl,'6'

    mov ah,1
    int 21h

    cmp al,dl
    je l1
    
    mov dl,10
    mov ah,2
    int 21h

    mov dx,offset msg2
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h

    l1:
        mov dl,10
        mov ah,2
        int 21h

        mov dx,offset msg1
        mov ah,9
        int 21h

        mov ah,4ch
        int 21h
main endp
end main