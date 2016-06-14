from sequtils import foldl, toSeq
from math import sqrt

# This one is VERY slow
#proc triangle_num(n: int): int =
#    return foldl(toSeq(1..n), a + b)

proc triangle_num(n: int): int =
    if n == 1: return 1
    else:
        return toInt((n * (n + 1)) / 2)

proc divisors(n: int): int =
    var d: seq[int] = @[]
    d.add(@[1, n])
    for elem in 2..toInt(sqrt(toFloat(n))):
        if n %% elem == 0:
            d.add(elem)
            d.add(toInt(n / elem))
    return len(d)

var
    current_div = 0
    current_index = 1
    current_tri = 0
while current_div < 500:
    current_tri = triangle_num(current_index)
    current_div = divisors(current_tri)
    if current_div < 500:
        inc(current_index)
echo(current_tri)
