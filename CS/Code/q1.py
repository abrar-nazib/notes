n = int(input())

if(n % 2 != 0 and n > 2):
    j = 1
    s = 0
    for x in range(1, n, 2):
        if(j % 3 != 0):
            s = s+(x*(x+1)*(x+2))
        else:
            s = s-(x*(x+1)*(x+2))
        j = j+1
    print(s)
else:
    print("Invalid Input!")
