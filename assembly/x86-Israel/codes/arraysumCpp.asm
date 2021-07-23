; #include <iostream>

; extern "C" int CalcArraySumAsm(int* arrayPointer, int arraySize); //assembly function prototype

; int CalcArraySumCpp(int* arrayPointer, int arraySize); //C function prototype

; int main() {
; 	int arr[10] = { 1,2,3,4,5,6,7,8,9,10 };
; 	int n = sizeof(arr) / sizeof(int);
; 	std::cout << "Assembly sum: " << CalcArraySumAsm(arr, n) << std::endl;
; 	std::cout << "C sum: " << CalcArraySumCpp(arr, n) << std::endl;
; 	return 0;
; }

; int CalcArraySumCpp(int* arrayPointer, int arraySize) {
; 	int sum = 0;
; 	for (int i = 0; i < arraySize; i++) {
; 		sum += arrayPointer[i];
; 	}
; 	return sum;
; }
.model flat,c
.code
CalcArraySumAsm proc
	prolog:
		push ebp
		mov ebp, esp

	mainCode:
		mov edx, [ebp+8]
		mov ecx, [ebp+12]

		;My version of the code: mov eax, 0
		xor eax, eax	;cleaning up the eax register
		;safety mechanism to check for a negative size
		cmp ecx, 0
		jle epilog
		
		;the whole addloop is my version of the code
		;addloop:
			;add eax,[edx]
			;add edx, sizeof dword
			;loop addloop

	@@:
		add eax, [edx]
		add edx, sizeof dword
		dec ecx
		jnz @B	;jumb backward to the nearest @@ symbol if ecx not equal to zero

	epilog:
		pop ebp
		ret
CalcArraySumAsm endp
end