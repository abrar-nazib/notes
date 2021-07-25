ORG 0x7C00              ;telling the BIOS to load us into the specified address
BITS 16                 ;telling the assembler that we are using a 16 bit architecture

start:
    mov si, message     ;storing the address of the message label inside the si register
    call print   
    jmp $               ;jump to current line of code again and again

print:
    mov bx, 0           ;both foreground color and page number set at once
    .loopx:
        lodsb           ;loads an character from the si register's address and stores into the al register 
                        ;and increments the value of the si register by one
        cmp al, 0       ;if 0 is loaded into al, terminate the program
        je .done
        call print_char
        jmp .loopx
    .done:
        ret

print_char:
    mov ah, 0eh         ;getting ready for video/teletype output
    int 10h             ;video/teletype output which prints the character in al register
    ret

message: db 'Hello World!', 0
    ;the next section won't execute in this code cz we don't have any bootloader yet
    times 510-($ - $$) db 0  ;fill the rest of the memory with zeros
    dw 0xAA55           ;the actual thing is 0x55AA. It's written like this because intel processors follow little endian method
                        ;dw means dword in assembly
    