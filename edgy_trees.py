import itertools

n, k = list(map(int, input().split()))

class Vert:

    def __init__(self, i):
        self.redir = False
        self.graph = {i}
    
    def redirect(self, redir_vert):
        self.redir_vert = redir_vert
        self.redir = True

forest = [Vert(i) for i in range(0, n)]

def nedge(edge):
    return [edge[0]-1, edge[1]-1, edge[2]]

while True:
    try:
        # [from, to, color]
        edge = nedge(list(map(int, input().split())))
        if edge[2] != 1:
            vert1 = forest[edge[0]]
            while vert1.redir:
                vert1 = vert1.redir_vert
            
            vert2 = forest[edge[1]]
            while vert2.redir:
                vert2 = vert2.redir_vert
            
            vert1.graph |= vert2.graph
            vert2.redirect(vert1)
    except EOFError:
        break


total_seqs = n ** k

for vert in forest:
    if not vert.redir:
        total_seqs -= (len(vert.graph) ** k)

print(total_seqs % (10 ** 9 + 7))
