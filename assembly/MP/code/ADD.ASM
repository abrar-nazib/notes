;Program to add two integer numbers
;Author: Nazib Abrar
;Date: 20 Jun, 2021
dosseg
.model small
.stack 100h
.data
.code
main proc
    mov bl,2    ;moving values to a general purpose registers
    mov cl,3    

    add bl,cl   ;here, bl is the destination register and cl is the source register
                ;cl won't change its value, but bl will hold the result of addition of the bl,cl
    add bl,48   ;ASCII 0=48, bl+48 will generate the ascii value of the result and put it into bl

    mov dl,bl   ;moving the answer to data register
    
    mov ah,2    
    int 21h
    
    mov ah,4ch
    int 21h
main endp
end main