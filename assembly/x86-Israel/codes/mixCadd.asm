;Program for emulating a c function int add(int a, int b, int c) in assembly
.386
.model flat,c	;here c means we want to use c type names for public symbols 
.code
AdderASM PROC
	push ebp
	mov ebp, esp
	
	mov eax, [ebp+8]	;eax = a
	mov ecx, [ebp+12]	;ebx = b
	mov edx, [ebp+16]	;ecx = c

	add eax, ecx
	add eax, edx

	pop ebp

	ret
AdderASM ENDP
END

