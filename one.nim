import sequtils
import future

proc mult_3_5(num: int): int =
  var i: int = 3
  while i < num:
    if i mod 3 == 0 or i mod 5 == 0:
      result += i
    i += 1

proc mult_3_5b(num: int): int =
  toSeq(1..num-1).filter(x => x mod 3 == 0 or x mod 5 == 0).foldl(a + b)

echo mult_3_5(1000)
echo mult_3_5b(1000)
