;Program to input a character from user and print it on screen
;Author: Nazib Abrar
;Date: 20 Jun, 2021
dosseg
.model small
.stack 100h
.data
.code
main proc
    mov ah,1    ;moving 1 in accumulator means input will be saved in al portion of the register
    int 21h

    mov dl,al   ;register addressing -> moving the inputted value inside data register
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
main endp
end main