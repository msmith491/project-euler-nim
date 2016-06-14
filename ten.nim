import math

proc is_prime(n: int): bool =
    if n <= 0: return false
    elif n in {1..3}: return true
    elif n %% 2 == 0: return false
    else:
        let term = toInt(math.ceil(math.sqrt(toFloat(n))))
        for elem in countup(3, term, step = 2):
            if n %% elem == 0:
                return false
        return true

proc sum_primes(n: int): int64 =
    result = 2
    for num in countup(3, n - 1, step=2):
        if is_prime(num):
            result += num

echo(sum_primes(2000000))
