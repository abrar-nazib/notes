;Program Description: Program to declare variables
;Author: Nazib Abrar
;Date: 8 July, 2021

.386				;The minimum type of processor needed to run this program
.model flat			;Program is for protected addressing mode
.data				;Data segment of the code
	;declaring 4 byte variables in hexadecimal
	num1 dword 11111111h
	num2 dword 10101010h
	ans dword 0h
.code				;Code segment of the program
start proc
	mov eax , num1
	add eax, num2
	mov ans, eax
	ret
start endp
end start
