;Code to test an array
;Author: Nazib Abrar
;Date: 1 July, 2021
dosseg
.model small
.stack 100h
.data
    arr1 db 1,2,3,4

.code
main proc
    ;moving address of the data segment inside accumulator and then in ds register which stores address of data segment
    mov ax,@data
    mov ds,ax

    ;storing the address of the arr1 variable inside the source index register
    mov si,offset arr1
    
    ;moving the content of source index register into data register
    inc si
    mov dl,[si]
    add dl,48       ;adjusting the integer data with ascii value

    ;printing the first element of the array
    mov ah,2
    int 21h
    
    ;terminating the terminal session
    mov ah,4ch
    int 21h
main endp
end main