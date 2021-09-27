size = int(input())
av_chocos = input()
av_chocos = list(map(int, av_chocos.split()))

least = float("inf")
total = 0
for i in reversed(av_chocos):
    least = min(i, least - 1)

    if least == 0:
        break

    total += least

print(total)