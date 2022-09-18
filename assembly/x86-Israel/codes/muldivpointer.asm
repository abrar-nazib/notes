;Program to emulate a function int IntegerMulDiv(int a, int b, int* product, int* quotient, int* remainder);
;returns 0 if there is any error, returns 1 if success
;Computation: *product = a*b
;			: *quotient = a/b
;			: *remainder = a%b  
.386
.model flat,c	;here c means we want to use c type names for public symbols 
.code
IntegerMulDiv PROC
	;--------------------------------<prologue>
	push ebp
	mov ebp, esp
	push ebx	;
	;-------------------------------</prologue>
	
	xor eax, eax	;making sure that divisor is not zero

	mov ecx, [ebp+8]	;ecx = a
	mov edx, [ebp+12]	;edx = b

	or edx, edx		;or operation checks whether the result(b) is zero or not
	jz InvalidDivisor
	
	imul edx, ecx		;the  multiplied value is inside edx now
	mov ebx, [ebp+16]	;ebx = product
	mov [ebx], edx		;*product = edx or multiplied value

	mov eax, ecx		;eax = a
	cdq					;conver dword to qword-> edx:eax contains dividend
	idiv DWORD PTR[ebp+12]	;eax/[ebp+12] quotient = eax, remainder = edx
	
	mov ebx,[ebp+20]	;ebx = quotient
	mov [ebx], eax		;*quotient = eax
	
	mov ebx, [ebp+24]	;ebx = remainder
	mov [ebx], edx		;*remainder = edx

	mov eax, 1			;everything went fine so returning 1

InvalidDivisor:
	;-----------------------------------<epilogue>
	pop ebx
	pop ebp
	;----------------------------------</epilogue> 
	ret
IntegerMulDiv ENDP
END

