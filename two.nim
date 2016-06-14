proc fib(n: int): int =
    if n == 0: return 0
    if n == 1: return 1

    var
        prev: int = 1
        prev2: int = 0
        r: int = 2

    for elem in 2..(n+1):
        r = prev + prev2
        prev2 = prev
        prev = r

    return r

proc fib_sum_even_below(n: int): int =
    var tmp: int = 0
    result = tmp
    var
        num: int = 1
        current: int = 0
        found = newSeq[int]()
    while current < n:
        current = fib(num)
        if current %% 2 == 0:
            found.add(current)
            result += current
        num += 1

echo(fib_sum_even_below(4000000))

