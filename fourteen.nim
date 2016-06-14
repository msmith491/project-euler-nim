proc collatzChain(n: int): seq[int] =
    result = @[n]
    var cur = n
    while cur > 1:
        if cur %% 2 == 0:
            cur = toInt(cur/2)
        else:
            cur = (cur * 3) + 1
        result.add(cur)

proc biggestCollatz(h: int): int =
    var biggest = 0
    for elem in 14..h:
        let tmp = len(collatzChain(elem))
        if tmp > biggest:
            biggest = tmp
            result = elem

echo(biggestCollatz(1000000))
