;A program to write a single character on the screen
;Author: Nazib Abrar
;Date: 30 Jun, 2021
dosseg              ;Manages the arrangement of the segments of the program
.model small        ;data section <= 64KB and code section <= 64KB
.stack 100h         ;size of the stack section is 100hexadecimal
.data
.code
Main proc
    mov dl,'H'      ;Move the character 'H' to a data(low) register => immediate addressing
    mov ah,2        ;Put 2 inside accumulator => 2 means outputting a character
    INT 21H         ;Interrupt for showing on the screen
    mov ah,4ch      ;Put 4ch inside accumulator => 4ch means Exit the accumulator session
    INT 21H         ;Interrupt for updating the screen
Main endp
End Main
