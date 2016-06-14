import bigints

proc self_powers(n: BigInt): BigInt =
    result = initBigInt(0)
    for elem in initBigInt(1)..n:
        result += pow(elem, elem)

var big = self_powers(1000.initBigInt)
var str = $big
echo(str[(len(str)-10)..(len(str)-1)])
