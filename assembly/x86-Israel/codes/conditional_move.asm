; #include <iostream>

; //using conditional jumps
; extern "C" int SignedMinA(int a, int b, int c);
; extern "C" int SignedMaxA(int a, int b, int c);
; //using conditional moves
; extern "C" int SignedMinB(int a, int b, int c);
; extern "C" int SignedMaxB(int a, int b, int c);


; int main()
; {
;     int a = 234;
;     int b = -534;
;     int c = 22;
;     std::cout << SignedMinA(a, b, c) << std::endl;
;     std::cout << SignedMaxA(a, b, c) << std::endl;
;     std::cout << SignedMinB(a, b, c) << std::endl;
;     std::cout << SignedMaxB(a, b, c) << std::endl;
;     return 0;
; }
;.386 does not work here
;dunno why
.model flat,c
.code

;---------------------------------------------Min()
SignedMinA proc
	prolog:
		push ebp
		mov ebp, esp
	cmp1:
		mov eax, [ebp+8]	;eax = a
		mov ecx, [ebp+12]	;ebx = b

		cmp eax, ecx
		jle @F		;jump forward to the nearest @@ symbol if less-than or equal to 

	mov eax, ecx	;eax = min(a,b)

	@@:
		mov ecx, [ebp+16]
		cmp eax, ecx
		jle epilog	;jump forward to the nearest @@ symbol if less-than or equal to
		mov eax, ecx ;eax = min(b,c)

	epilog:
		pop ebp
		ret
SignedMinA endp

;------------------------------------------ Max()
SignedMaxA proc
	prolog:
		push ebp
		mov ebp, esp
	
	cmp1:
		mov eax, [ebp+8]		;eax = a
		mov ecx, [ebp+12]		;ecx = b

		cmp eax, ecx
		jge cmp2	;if a>b start comparison 2

	mov eax, ecx	;else a = b
	
	cmp2:
		mov ecx, [ebp+16]
		cmp eax, ecx
		jge epilog
	mov eax, ecx

	epilog:
		pop ebp
		ret
SignedMaxA endp
;-------------------------------------------Min() v2.0
SignedMinB proc
	prolog:
		push ebp
		mov ebp, esp
	
	cmp1:
		mov eax, [ebp+8]
		mov ecx, [ebp+12]

		cmp eax, ecx
		cmovg eax, ecx		;this instruction moves the content of ecx into eax if eax is greater than ecx
							;had to use cmova for unsigned operations
	cmp2:
		mov ecx, [ebp+16]
		cmp eax, ecx
		cmovg eax, ecx

	epilog:
		pop ebp
		ret
SignedMinB endp
;----------------------------------------Max() v2.0
SignedMaxB proc
	prolog:
		push ebp
		mov ebp, esp
		
	cmp1:
		mov eax, [ebp+8]
		mov ecx, [ebp+12]

		cmp eax, ecx
		cmovl eax, ecx		;moves the content of ecx inside eax if eax is less than ecx
							;unsigned version of this instruction is cmovb

	cmp2:
		mov ecx, [ebp+16]
		cmp eax, ecx
		cmovl eax, ecx

	epilog:
		pop ebp
		ret
SignedMaxB endp
end