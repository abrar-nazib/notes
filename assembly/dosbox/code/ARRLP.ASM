;Code for looping through an array
;Author: Nazib Abrar
;Date: 2 July, 2021
dosseg
.model small
.stack 100h
.data
    arr db 5 dup('A')

.code
main proc
    ;connecting the address of the data segment with data segment register
    mov ax,@data
    mov ds,ax

    ;moving the address of the array in the source index register
    mov si,offset arr

    ;printing the five elements of the arry
    mov cx,5
    arrloop:
    mov dl,[si]

    mov ah,2
    int 21h
    inc si
    loop arrloop

    ;terminating the terminal session
    mov ah,4ch
    int 21h
main endp
end main