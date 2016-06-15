from sequtils import toSeq, filter, foldl

proc mult_3_and_5(num: int): int =
    var sum = 0;
    for elem in 3..(num - 1):
        if elem mod 3 == 0 or elem mod 5 == 0:
            sum += elem
    return sum

proc mult_3_and_5_b(num: int): int =
    result = toSeq(1..(num - 1))
        .filter(
            proc(x: int): bool = x mod 3 == 0 or x mod 5 == 0)
        .foldl(a + b)

var answer : int = mult_3_and_5(1000)
echo(answer)
answer = mult_3_and_5_b(1000)
echo(answer)
