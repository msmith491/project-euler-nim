import math

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

proc nth_prime(n: int): int =
    if n == 1: return 1
    if n == 2: return 2
    
    var 
        index = 2
        result = 3
    while index <= n:
        let prime = is_prime(result)
        if prime and index == n:
            return result
        elif prime:
            inc(index)
            inc(result, 2)
        else:
            inc(result, 2)

echo(nth_prime(10001))

            
