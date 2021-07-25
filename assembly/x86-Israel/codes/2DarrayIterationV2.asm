; #include <iostream>

; extern "C" void CalcArraySumA(const int* inpArr, const int nRow, const int nCol, int* rowSum, int* colSum);

; int main() {
; 	const int nRow = 7;
; 	const int nCol = 5;
; 	int rowSum[nRow];
; 	int colSum[nCol];
; 	int inpArr[nRow][nCol] = { {1,1,1,1,1}, {2,2,2,2,2}, {3,3,3,3,3}, {4,4,4,4,4}, {5,5,5,5,5}, {6,6,6,6,6}, {7,7,7,7,7} };
; 	CalcArraySumA(&inpArr[0][0], nRow, nCol, rowSum, colSum);
; 	for (int i = 0; i < nRow; i++) {
; 		for (int j = 0; j < nCol; j++) {
; 			std::cout << " " << inpArr[i][j] << " ";
; 		}
; 		std::cout << rowSum[i] << std::endl;
		
; 	}
; 	for (int j = 0; j < nCol; j++) {
; 		std::cout << colSum[j] << " ";
; 	}
; 	std::cout << std::endl;
; 	return 0;
; }

.model flat,c
.code
CalcArraySumA proc
	;Reference C program: extern "C" void CalcArraySumA(const int* inpArr, const int nRow, const int nCol, int* rowSum, int* colSum);
	prolog:
		push ebp
		mov ebp, esp
		push ebx
		push esi
		push edi
		
	body:
		_cleanup:
			;putting 0 into the memory of rowSum
			mov ecx, [ebp+12]
			cmp ecx, 0
			jle epilog		;safety feature for invalid nRow
			mov edi, [ebp+20]
			xor eax, eax
			rep stosd
			
			;puting 0 into the memory of colSum
			mov ecx, [ebp+16]
			cmp ecx, 0
			jle epilog					;safety feature for invalid nCol
			mov edi, [ebp+24]
			xor eax, eax
			rep stosd
			
			mov ebx, [ebp+8]			;ebx = &inpArr

			xor edi, edi				;edi will be used as i and now edi = 0
		_outerLoop:
			
			xor esi, esi
			_innerLoop:
				mov edx, edi
				imul edx, [ebp+16]
				add edx, esi
				imul edx, 4

				mov eax, [ebx+edx]
				mov ecx, [ebp+20]               ;ecx=&rowSum
				add dword ptr [ecx+edi*4], eax
				mov ecx, [ebp+24]               ;ecx=&colSum
				add dword ptr[ecx+esi*4], eax

				add dword ptr[ecx+esi*4], eax
									
				inc esi
				cmp esi, [ebp+16]
				jl _innerLoop

			inc edi
			cmp edi, [ebp+12] 
			jl _outerLoop				;jump when edi is less than 

	epilog:
		pop edi
		pop esi
		pop ebx
		pop ebp
		ret
CalcArraySumA endp
end