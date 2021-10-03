# https://open.kattis.com/problems/sequences

def read_line():
	return input()

s = read_line()
mod = int(1e9 + 7)

qs = [int(s[0] == "?")] * len(s) # cumulative count of "?" upto index i
os = [int(s[0] == "1")] * len(s) # cumulative count of "1" upto index i
nis = [0] * len(s) # n. of inversions for a substring 0:i

for i in range(1, len(s)):
	qs[i] = qs[i-1]
	os[i] = os[i-1]
	
	if s[i] == "?":
		qs[i] += 1
	
	if s[i] == "1":
		os[i] += 1

def n_inversion(i):

	if s[i] == "1":
		return nis[i-1]
	else:
		res = (nis[i-1] + (pow(2, qs[i-1], mod)*os[i-1])%mod)%mod
	
	if qs[i-1]:
		res = (res+(qs[i-1]*pow(2,qs[i-1]-1, mod)))%mod
		
	if s[i] == "?":
		res = (res+nis[i-1])%mod
	
	return res

for i in range(1, len(s)):
	nis[i] = n_inversion(i)

print(nis[-1])
