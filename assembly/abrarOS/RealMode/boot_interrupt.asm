ORG 0                   ;Sets the location counter's value to 0
BITS 16                 ;telling the assembler that we are using a 16 bit architecture
_start:
    jmp short start
    nop                  ;bios expects these three lises of code
times 33 db 0           ;will fill the 33 bytes of memory with zeros for safety purpose

start:
    jmp 0x7C0:step2     ;

handle_zero:            ;will be used for handling interrupt zero
    mov ah, 0eh
    mov al, 'A'
    mov bx, 0x00
    int 0x10
    iret


step2:    
    cli                 ;clears all the hardware interrupts for setting up the segment registers because it's a very critical job to do
    
    ;setting up the data segment
    mov ax, 0x7C0       ;can't put the value directly into data segment register so applying this method
    mov ds, ax          ;data segment register is holding dec(0x7c0) * 16 or 0x7C00 
    mov es, ax          ;extra segment register is also holding the same address   
    
    ;setting up the stack segment
    mov ax, 0x00        ;can't put the value directly into the stack segment register so applying this method
    mov ss, ax          ;stack segment register is holding the dec(0x00) * 16 or 0 
    mov sp, 0x7C00      ;giving the program 0x7C00 sized stack
    
    sti                 ;Enables Interrupts
    
    mov word[ss:0x00], handle_zero      ;if we don't specify stack segment, it would use the data segment
    mov word[ss:0x02], 0x7c0               ;little endian effect for storing the offset in the second two bytes
    int 0

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
    