; //assembly function which will calculate square of each element of an array
; #include <iostream>

; extern "C" int CalcArraySquareASM(int* outputArray, int* inputArray, int arraySize);
; int CalcArraySquareCPP(int* outputArray, int* inputArray, int arraySize);
; int main() {
; 	int outArr[10];
; 	int inArr[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
; 	int arrSize = sizeof(outArr) / sizeof(int);
; 	int sum = CalcArraySquareCPP(outArr, inArr, arrSize);
; 	std::cout << sum << std::endl;
; 	for (int i = 0; i < arrSize; i++) {
; 		std::cout << inArr[i] << "<-->" << outArr[i] << std::endl;
; 	}
; 	return 0;
; }

; int CalcArraySquareCPP(int* outputArray, int* inputArray, int arraySize) {
; 	int sum = 0;
; 	for (int i = 0; i < arraySize; i++) {
; 		outputArray[i] = inputArray[i] * inputArray[i];
; 		sum += outputArray[i];
; 	}
; 	return sum;
; }
.model flat,c
.code
CalcArraySquareASM proc
prolog:
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

body:
	mov edi, [ebp+8]	;output array's address is inside edi
	mov esi, [ebp+12]	;input array's address is inside esi
	mov ecx, [ebp+16]	;array size is inside ecx
	xor eax, eax		;cleainng up the eax register for future use
						;will be using for storing the sum of the array
	cmp ecx, 0			;defence mechanism for invalid size of 
	jle epilog

	shl ecx, 2			;ecx multiplied by 2^2
	xor ebx, ebx		;for array element offset

@@:	mov edx, [esi+ebx]	;load next x[i]
	imul edx, edx		;edx *= edx

	mov [edi+ebx], edx
	add eax, edx		;updates the running sum
	add ebx, 4
	cmp ebx, ecx
	jl @B				;jump backwards to the nearest @@ sign


epilog:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
CalcArraySquareASM endp
end