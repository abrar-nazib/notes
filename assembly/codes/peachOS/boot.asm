ORG 0x7c00  ;Origin memory address
BITS 16 ;Telling the assembler that we are using a 16 bit memory system


start:       ;-------------this three lines say output the character 'A' in the terminal
    mov si, message
    call print
    jmp $ ;not sure what this thing does, need to learn assembly so bad

print: 
    mov bx, 0    ;move 0 to the bx register
.loop:
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .loop
.done: 
    ret

print_char:
    mov ah, 0eh  ;move a value into ah register -> here this command is meant to load something in the screen
    int 0x10     ;calling an inturrupt function-> in this case we are calling the bios
    ret
   
message: db 'Hello World!', 0

times 510-($ - $$) db 0 ;we need to fill at least 510 bytes with data-> so if the instructions above does not fill the memory with intended data, the rest of the memory will be filled with zeros
dw 0xAA55 ;reversed because in intel machines, bytes get flipped