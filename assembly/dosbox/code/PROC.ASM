;Program to test assembly procedures
;Author: Nazib Abrar
;Date: 2 July, 2021
dosseg
.model small
.stack 100h
.data
    var1 db 'mairala$'
    var2 db 'yoyo pups$'
    var3 db 'obhaiii koi mujhe maro$'
.code

main proc
    ;moving the address of data segment inside data segment register
    mov ax, @data
    mov ds, ax

    mov dx, offset var1
    call printstr
    call linebrake
    mov dx, offset var2
    call printstr
    call linebrake
    mov dx, offset var3
    call printstr
    
    mov ah,4ch
    int 21h
main endp

printstr proc
    mov ah, 9
    int 21h
    ret
printstr endp

linebrake proc
    mov dl, 10
    mov ah, 2
    int 21h

    mov dl, 13
    mov ah, 2
    int 21h
    ret
linebrake endp


end main