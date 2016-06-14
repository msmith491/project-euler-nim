import bigints
from math import pow
from strutils import parseInt
from sequtils import foldl

var
    big: BigInt = pow(2.initBigint(), 1000.initBigint())
    s: string = $big

proc digitAdder(s: string): int =
    var hold: seq[int] = @[]
    for elem in s:
        hold.add(parseInt($elem))
    return foldl(hold, a + b)

echo(digitAdder(s))
