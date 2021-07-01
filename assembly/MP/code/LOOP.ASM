;Code to test a loop by printing 1 to 9
;Author: Nazib Abrar
;Date: 1 July, 2021
dosseg
.model small
.stack 100h
.data
    str1 db 'mairala$'

.code
main proc
    mov ax,@data
    mov ds,ax

    

    mov cx,26       ;Setting the counter register
    mov dx,65       
    loopingLabel:
        mov ah,2
        int 21h 
        
        ;add dx,1    ;incrementing the dx register value
        inc dx     ;increments dx by 1
    loop loopingLabel

    mov ah,4ch
    int 21h
main endp
end main
