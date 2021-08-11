# Problem:
# Use each of the numbers 1, 3, 4, and 6 exactly once with any
# of the four basic math operations (addition, subtraction,
# multiplication, and division) to total 24. Each number must be
# used once and only once, and you may define the order of
# operations; for example, 3 * (4 + 6) + 1 = 31 is valid, however
# incorrect, since it doesn’t total 24.


import re
from itertools import permutations
from itertools import combinations
from itertools import combinations_with_replacement

numbers = ['1', '3', '4', '6']
brackets = ['(', '(', ')', ')']
operators = ['/', '*', '-', '+']

operatorCombinations = list(combinations_with_replacement(operators, 3))
numberPermutations = list(permutations(numbers))


def bracketarray():
    OBposition = [0, 1, 4, 5, 8, 9]
    CBposition = [6, 7, 10, 11, 14, 15]

    bracetCombinationArray = []
    OBcombinations = list(combinations(OBposition, 2))
    for OBcomb in OBcombinations:
        blankarr = [' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
        for oelem in OBcomb:
            blankarr[oelem] = '('
        CBcombinations = list(combinations(CBposition, 2))
        for CBcomb in CBcombinations:
            tempBlankarr = blankarr.copy()
            for celem in CBcomb:
                tempBlankarr[celem] = ')'
            bracetCombinationArray.append(tempBlankarr)
    return bracetCombinationArray


# for every permutation of [1, 3, 4, 6]
for permutedNumbers in numberPermutations:
    # for 3 of every combination of []
    for oc in operatorCombinations:
        ocperm = list(set(permutations(oc)))
        for ocp in ocperm:
            bracketarr = bracketarray().copy()
            for xblankarr in bracketarr:
                # print(''.join(xblankarr))
                expression = [xblankarr[0], xblankarr[1]]
                expression.append(permutedNumbers[0])
                expression.append(xblankarr[2])
                expression.append(xblankarr[3])
                for i in range(len(ocp)):
                    expression.append(ocp[i])
                    expression.append(xblankarr[i*4+4])
                    expression.append(xblankarr[i*4+5])
                    expression.append(permutedNumbers[i+1])
                    expression.append(xblankarr[i*4+6])
                    expression.append(xblankarr[i*4+7])
                try:
                    exp = ''.join(expression)
                    exp = exp.replace(' ', '')
                    value = eval(exp)
                    if(value == 24 and len(re.findall(r'\((\d*?)\)', exp)) == 0):
                        print(f'{exp} = {value}')
                        # exit()
                except:
                    pass


# *  (( '6',    [()] '/',       (( '1',     )) '-',  (( '3',        )) '/',     [()] '4'        ))
#   [0][1]      [2][3]       [4][5]      [6][7]     [8][9]      [10][11]      [12][13]      [14][15]
#   [][]      [][]       [][]      [][]     [][]      [][]      [][]      [][]
#   [][]      [][]       [][]      [][]     [][]      [][]      [][]      [][]


# ['6', '/', '1', '-', '3', '/', '4']

# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4']
# ['6', '/', '1', '-', '3', '/', '4'
