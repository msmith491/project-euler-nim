from unicode import reversed

proc is_palindrome(n: int): bool =
    var
        snum: string = $n
        tmp: string = reversed(snum)
    return snum == tmp

proc palindrome_product(n: int): int =
    var found: seq[int] = @[]
    for elem1 in countdown(n, toInt(n/2)):
        for elem2 in countdown(n, toInt(n/2)):
            let prod = elem1 * elem2
            if is_palindrome(prod):
                found.add(prod)
    return max(found)

echo(palindrome_product(999))
