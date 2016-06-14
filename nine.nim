proc pythagorean_triplet(num: int): seq[int] =
    for a in 1..num:
        for b in a..num - a:
            for c in b..(num - (a + b)):
                if a + b + c == num and a*a + b*b == c*c:
                    result = @[a, b, c]
                    return result

let trip = pythagorean_triplet(1000)
echo(trip)
echo(trip[0] * trip[1] * trip[2])
