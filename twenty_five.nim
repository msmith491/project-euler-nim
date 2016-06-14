import bigints

proc fib(n: int): BigInt =
    if n == 0: return 1.initBigInt()
    if n == 1: return 1.initBigInt()

    var
        prev = 1.initBigInt()
        prev2 = 0.initBigInt()
        r = 2.initBigInt()

    for elem in 2..(n+1):
        r = prev + prev2
        prev2 = prev
        prev = r

    return r

proc nLenFib(n: int): int=
    var
        step = 50
        l = 0
        current = 0
        r = 0.initBigInt()
    while l <= n:
        r = fib(current)
        l = len($r)
        inc(current, step)
    
    # We went too far, backtrack
    current -= 2*step
    l = 0
    while l < n:
        r = fib(current)
        l = len($r)
        inc(current)
    return current

echo(nLenFib(1000))
#echo(len($fib(4782)))
