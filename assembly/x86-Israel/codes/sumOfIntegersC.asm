;A program to find out the sum of three integers, sum of the square of three integers, the sum of the qube of three integers
;The C++ program looks like this: void calculateSum(int a, int b, int c, int* s1, int* s2, int* s3)
.386
.model flat,c
.code
calculateSum proc
;Prolog:
	push ebp
	mov ebp, esp
	sub esp, 12			;Allocating space for 3 integer type local variables;;;;;;;;;;;;x86 stack grows downwards
	push ebx
	push esi
	push edi

;load arguments:
	mov eax, [ebp+8]	;eax = a
	mov ebx, [ebp+12]	;ebx = b
	mov ecx, [ebp+16]	;ecx = c
	mov edx, [ebp+20]	;edx = s1
	mov esi, [ebp+24]	;esi = s2
	mov edi, [ebp+28]	;edi = s3

;storing the general sum in temporary location
	mov [ebp-12], eax
	add [ebp-12], ebx
	add [ebp-12], ecx	

;calculation for storing inside s2
	imul eax, eax		;eax *= eax
	imul ebx, ebx		;ebx *= ebx
	imul ecx, ecx		;ecx *= ecx

	mov [ebp-8], eax
	add [ebp-8], ebx
	add [ebp-8], ecx

;calculation for storing inside s3
	imul eax, [ebp+8]
	imul ebx, [ebp+12]
	imul ecx, [ebp+16]

	mov [ebp-4], eax
	add [ebp-4], ebx
	add [ebp-4], ecx

;storing the values inside the memory the pointers point to
	mov eax, [ebp-12]
	mov [edx], eax
	mov eax, [ebp-8]
	mov [esi], eax
	mov eax, [ebp-4]
	mov [edi], eax

;Epilog:
	pop edi
	pop esi
	pop ebx
	add esp, 12
	pop ebp
	ret
calculateSum endp
end