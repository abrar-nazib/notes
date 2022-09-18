;Program to multiply two 8 bit variables
;Author: Nazib Abrar
;Date: 3 July, 2021
print macro datatype, data
    mov datatype, data
    add datatype, 48
    mov ah, 2
    int 21h
endm
newline macro
    mov dl, 10
    mov ah, 2
    int 21h

    mov dl, 13
    mov ah, 2
    int 21h
endm
dosseg
.model small
.stack 100h
.data
    multiplicand db 12
    multiplier db 3
    answer dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, multiplicand
    mov bl, multiplier
    mul bl
    
    aam         ;ASCII adjust after multiplication

    mov cl, al
    mov ch, ah

    print dl, ch
    print dl, cl

    mov ah, 4ch
    int 21h

main endp
end main