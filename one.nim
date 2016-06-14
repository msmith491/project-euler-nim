proc mult_3_and_5(num: int): int =
    var sum = 0;
    for elem in 3..(num - 1):
        if elem mod 3 == 0 or elem mod 5 == 0:
            sum += elem
    return sum

var answer : int = mult_3_and_5(1000)
echo(answer)
