;Program to test how macros work
;Author: Nazib Abrar
;Date: 2 July, 2021

;defining a macro which prints strings
print macro string
    mov dx, offset string
    mov ah, 9
    int 21h
endm

linebreak macro
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
    str1 db 'string1$'
    str2 db 'string2$'

.code
main proc
    mov ax, @data
    mov ds, ax
    print str1  ;will print the macro text in here
    linebreak
    print str2

    mov ah, 4ch
    int 21h

main endp
end main