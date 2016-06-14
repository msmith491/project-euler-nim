import math

var num = 600851475143'i64


proc is_prime(n: int64): bool =
    if n <= 0: return false
    elif n in {1..3}: return true
    elif n %% 2 == 0: return false
    else:
        let term = toBiggestInt(math.ceil(math.sqrt(toBiggestFloat(n))))
        for elem in countup(3, term, step = 2):
            if n %% elem == 0:
                return false
        return true

proc prime_factors(n: int64): seq[int64] =
    result = @[]
    if n == 1 or is_prime(n):
        result.add(1)
    elif n %% 2 == 0:
        result.add(2)
    else:
        for elem in countup(3, toBiggestInt(math.ceil(math.sqrt(toBiggestFloat(n)))), step=2):
            if n %% elem == 0 and is_prime(elem):
                result.add(elem)

var result = prime_factors(num)
echo(result)
echo(result[len(result)-1])
