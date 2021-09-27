size = int(input())
nstr = input()

nsubstrs = 0

for i in range(0, size):
    if int(nstr[i]) % 2 == 0:
        nsubstrs += i + 1

print(nsubstrs)
