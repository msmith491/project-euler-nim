proc sum_of_squares(n: int): int =
    for elem in 1..n:
        result += (elem * elem)

proc square_of_sums(n: int): int =
    for elem in 1..n:
        result += elem
    result *= result

var num = 100
echo(square_of_sums(num) - sum_of_squares(num))
