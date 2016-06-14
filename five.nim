from math import fac

proc smallest_multiple(n: int): int =
    for elem1 in countup(n, fac(n), step=n):
        for elem2 in countdown(n, 1):
            if elem1 %% elem2 != 0:
                break
            elif(elem2 == 1):
                return elem1
    return 0

echo(smallest_multiple(20))
