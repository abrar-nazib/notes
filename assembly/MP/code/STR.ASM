;Program to print two strings in two different lines
;Author: Nazib Abrar
;Date: 20 Jun, 2021
dosseg
.model small
.stack 100h
.data
    msg1 db 'Hello$'        ;initialization of strings
    msg2 db 'World$'

.code
main proc
    mov ax,@data            ;moving address of data segment in accumulator ax(16 bit)
    mov ds,ax               ;moving ax inside data segment register => initiallizes a heap memory

    ;mov dx,offset msg1      ;moving string address into dx(16 bit){addresses are in 16 bit}
    lea dx,msg1             ;load effective address dx to msg1
    mov ah,9
    int 21h

    mov dx,10
    mov ah,2
    int 21h

    mov dx,13
    mov ah,2
    int 21h

    mov dx,offset msg2
    
    mov ah,9
    int 21h

    mov ah,4ch
    int 21h
main endp
end main