;Program to access array elements using different methods in assembly
;C function declarartion		: extern "C" void MemoryAddressing(int i, int* v1, int* v2, int* v3); //will be coded in assembly
;C global variable declaration	: extern "C" int NumFibVals;
.386
.model flat,c
.const					;this segment contains read only data
	FibVals dword 0, 1, 1, 2, 3, 5, 8, 13, 21
			dword 34, 55, 89, 144, 233, 377, 610	;equivalent to int FibVals[16] = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610}
	NumFibVals dword($-FibVals)/sizeof dword		;$ returns the value of the location counter register
	;equivalent to:  int FibVals = sizeof(Fibvals)/sizeof(int)
	
	public NumFibVals			;making this variable accessible to the other programs
.code 
MemoryAddressing PROC
	;prolog
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	;loading the i variable
	xor eax, eax				;clearing up the eax register
	mov ecx, [ebp+8]			;ecx = int i
	
	;checking the validity of int i
	cmp ecx, 0
	jl InvalidIndex				;jump if i is less than zero
	cmp ecx, [NumFibVals]
	jge InvalidIndex			;jump if i is greater or equal to the n(elements) in FibVals

	;Version 1: Using Base Register
	mov ebx, offset FibVals		;ebx = FibVals -> FibVals is a pointer
	mov esi, [ebp+8]			;esi = int i
	shl esi, 2					;esi = i * 4 -> shifting two to the left means multiplying 4 with the value within -> DWORD is 4 bytes in size
	add ebx, esi				;ebx = FibVals + i*4	-> ebx holds the memory address of FibVals[i]
	mov eax, [ebx]				;copy the Fibvals[i] inside eax 
	mov edi, [ebp+12]			;edi = v1
	mov [edi], eax				;*v1 = eax -> *v1 = FibVals[i] 

	;Version 2: Using Base Register + Displacement
	mov esi, [ebp+8]			;esi = int i
	shl esi, 2					; i *= 4
	mov eax, [esi+FibVals]		;esi+Fibvals returns the address of Fibvals[i] -> eax = Fibvals[i]
	mov edi, [ebp+16]			;edi = v3
	mov [edi], eax				;*v3 = eax

	;Version 3: Using Base Register + Index Register
	mov ebx, offset FibVals
	mov esi, [ebp+8]			;esi = int i
	shl esi, 2					; i *= 4
	mov eax, [ebx+esi]			;almost identical process to the second version
	mov edi, [ebp+20]			;edi = v3
	mov [edi], eax
	
	;Version 4: Using Base Register + index Register * scaling Factor
	mov ebx, offset FibVals
	mov esi, [ebp+8]
	mov eax, [ebx+esi*4]
	mov edi, [ebp+24]
	mov [edi], eax

	mov eax, 1
	jmp Terminate
InvalidIndex:
	mov eax, 0

Terminate:
	;epilog
	pop edi
	pop esi
 	pop ebx
	pop ebp
	ret
MemoryAddressing ENDP
END
;-------------------------------------the main c funtions--------------------------------
; #include <iostream>

; extern "C" int MemoryAddressing(int i, int* v1, int* v2, int* v3, int* v4); //will be coded in assembly
; extern "C" int NumFibVals;
; int main()
; {
;     int i = -1;
;     int v1, v2, v3, v4;
;     int* vv1 = &v1;
;     int* vv2 = &v2;
;     int* vv3 = &v3;
;     int* vv4 = &v4;
;     if (MemoryAddressing(i, vv1, vv2, vv3, vv4)) {
;         std::cout << "V1: FibVals[" << i << "] : " << v1 << std::endl;
;         std::cout << "V2: FibVals[" << i << "] : " << v2 << std::endl;
;         std::cout << "V3: FibVals[" << i << "] : " << v3 << std::endl;
;         std::cout << "V4: FibVals[" << i << "] : " << v4 << std::endl;
;     }
;     else {
;         std::cout << "Value i=" << i << " is Invalid" << std::endl;
;     }
;     return 0;
; }

