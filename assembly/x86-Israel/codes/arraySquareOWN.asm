; //assembly function which will calculate square of each element of an array
; //this file contains my version of the code
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
	mov esi, [ebp+8]	;output array's address is inside edx
	mov ebx, [ebp+12]	;input array's address is inside ebx
	mov ecx, [ebp+16]	;array size is inside ecx
	xor eax, eax		;cleainng up the eax register for future use

output_array_loading:
	push eax
	mov eax, [ebx]
	mov edi, eax
	xor edx, edx
	imul edi
	mov [esi], eax
	pop eax
	add eax, [esi]
	
	add esi, sizeof dword
	add ebx, sizeof dword
	
	loop output_array_loading

epilog:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
CalcArraySquareASM endp
end