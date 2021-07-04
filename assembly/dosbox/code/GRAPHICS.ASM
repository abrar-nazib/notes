;Program to draw a box in the screen
;Author: Nazib Abrar
;Date: 3 July 2021
dosseg
.model small
.stack 100h
.data
.code
main proc
    mov ah, 06h         ;scroll window up
    
    mov al, 10          ;number of lines to be filled
    
    mov bh, 00010000b   ;setting the color to blue
    
    mov ch, 0           ;starting position (top row position)
    mov cl, 0           ;starting position (leftmost position)

    mov dh, 15          ;ending position (bottom row)
    mov dl, 15          ;ending position (rightmost position)

    int 10h
    
    mov ah, 4ch
    int 21h
main endp
end main
