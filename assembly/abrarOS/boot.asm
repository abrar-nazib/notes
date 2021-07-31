ORG 0                   ;Sets the location counter's value to 0
BITS 16                 ;telling the assembler that we are using a 16 bit architecture
_start:
    jmp short start
    nop                  ;bios expects these three lises of code
times 33 db 0           ;will fill the 33 bytes of memory with zeros for safety purpose
start:
    jmp 0x7C0:step2     ;

    ; AH = 02h
    ; AL = number of sectors to read (must be nonzero)
    ; CH = low eight bits of cylinder number
    ; CL = sector number 1-63 (bits 0-5)
    ; high two bits of cylinder (bits 6-7, hard cd disk only)
    ; DH = head number
    ; DL = drive number (bit 7 set for hard disk)
    ; ES:BX -> data buffer

    ; Return:
    ; CF set on error
    ; if AH = 11h (corrected ECC error), AL = burst length
    ; CF clear if successful
    ; AH = status (see #00234)
    ; AL = number of sectors transferred (only valid if CF set for some
    ; BIOSes)

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

    mov ah, 02h         ;Read Sector command
    mov al, 1           ;Read one sector
    mov ch, 0           ;Cylinder low eight bits
    mov cl, 2           ;read sector 2
    mov dh, 0           ;head number will be zero
    mov bx, buffer
    int 0x13

    mov si, buffer
    call print

    jc error            ;if you found anything in carry, write error
    jmp $

error:
    mov si, error_message
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

error_message: db 'Failed to load Sector', 0
    ;the next section won't execute in this code cz we don't have any bootloader yet
    times 510-($ - $$) db 0  ;fill the rest of the memory with zeros
    dw 0xAA55           ;the actual thing is 0x55AA. It's written like this because intel processors follow little endian method
                        ;dw means dword in assembly
buffer: