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
		;cleaning up eax register
		xor eax, eax		
		;terminate program if row number is invalid
		cmp dword ptr [ebp+12], 0	;ebp+12 is nRow
		jle epilog
		;load column number in ecx register and terminate if invalid
		mov ecx, [ebp+16]
		cmp ecx, 0
		jle epilog
		
		;loading address of colSum array inside edi and cleaning it up
		mov edi, [ebp+24]
		xor eax, eax		;why it's needed to be done again? it's been done already
		rep stosd			;fill the array with zeros-> rep stosd stores the content of eax register into the location specified by edi
							;then increment the memory address by 1 and then repeats the job until the ecx register is zero
		;accessing the input array
		mov ebx, [ebp+8]
		xor esi, esi	;esi = 0 -> esi is being used as i

		outerLoop:
			mov edi, [ebp+20]					;edi = rowSum
			mov dword ptr[edi+esi*4], 0			;rowSum[i]=0
			xor edi, edi						;edi = 0 -> edi will now be used as j
			mov edx, esi						;edx = i
			imul edx, [ebp+16]					; edx *= nCol

			innerLoop:
				mov ecx, edx						;ecx = i*nCol
				add ecx, edi						;ecx = i*nCol + j
				mov eax, [ebx+ecx*4]				;eax = x[i*nCol+j]
				mov ecx, [ebp+20]					;ecx = rowSum
				add [ecx+esi*4], eax				;rowSum[i] += eax
				mov ecx, [ebp+24]					;ecx = colSum
				add [ecx+edi*4], eax				;colSum[j] += eax
		
				inc edi								;j++
				cmp edi, [ebp+16]					; comparing j and nCol
				jl innerLoop						;jump if j is less than nCol
	
			inc esi									;i++
			cmp esi, [ebp+12]						;
			jl outerLoop							;jump if i < nRow

			mov eax, 1
	epilog:
		pop edi
		pop esi
		pop ebx
		pop ebp
		ret
CalcArraySumA endp
end