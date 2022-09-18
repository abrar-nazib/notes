;Program to take input and echoing the string on the screen
;Author: Nazib Abrar
;Date: 2 July, 2021
dosseg
.model small
.stack 100h
.data
    instring db 10 dup('$')

.code
main proc
    ;storing the address of the data segment in the data segment registor
    mov ax,@data
    mov ds,ax
    ;storing the string array address in the source index register
    mov si,offset instring

    input:          ;kind of a while loop label
        ;take the input
        mov ah,1
        int 21h
        ;compare whether it's 'enter button' or not. If it's 'enter->ascii 13', echo the string
        cmp al,13
        je terminate    ;jump if equal

        mov [si],al
        inc si
        jmp input

    terminate:
        mov dx,offset instring
        mov ah,9
        int 21h
        
        mov ah,4ch
        int 21h

main endp
end main