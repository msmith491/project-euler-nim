import bigints
from sequtils import toSeq, filter, map, foldl

proc fib[T](n: T): BigInt =
    if n == 0: return 1.initBigInt
    if n == 1: return 1.initBigInt

    var
        prev = 1.initBigInt
        prev2 = 0.initBigInt
        r = 2.initBigInt

    for elem in (2.initBigInt)..(n.initBigInt+1):
        r = prev + prev2
        prev2 = prev
        prev = r

    r

# Super slow with bigints library
proc fibr[T](n: T): BigInt =
    let strn = $n
    case strn
    of "0":
        1.initBigInt
    of "1", "2":
        n.initBigInt
    else:
        fibr(n - 1) + fibr(n - 2)


proc fib_sum_even_below[T](n: T): BigInt =
    var tmp: int = 0
    result = tmp.initBigInt
    var
        num = 1.initBigInt
        current = 0.initBigInt
        found = newSeq[BigInt]()
    while current < n.initBigInt:
        current = fibr(num)
        if current mod 2.initBigint == 0:
            found.add(current)
            result += current
        num += 1

echo fib_sum_even_below(4000000)
