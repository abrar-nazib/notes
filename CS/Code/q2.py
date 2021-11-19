inpString = input()
inpList = inpString.split(" ")
# "The quick brown fox jumps over the lazy dog"
outList = []
for x in inpList:
    outList.append(x[0]+str(len(x)-2)+x[len(x)-1])
print(' '.join(outList))
