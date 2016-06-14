from math import floor

const
    digits: seq[string] = @["one", "two", "three", "four", "five", "six", "seven", "eight",
                                "nine"]
    teens: seq[string] = @["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
                            "sixteen", "seventeen", "eighteen", "nineteen"]
    suffix: seq[string] = @["hundred", "thousand"]
    predicates: seq[string] = @["twenty", "thirty", "fouty", "fifty", "sixty", "seventy",
                                    "eighty", "ninety"]

proc numToWord(n: int): string =
    if n in 1..9:
        return digits[n - 1]
    elif n in 10..19:
        return teens[(n %% 10)]
    elif n < 100 and n %% 10 == 0:
        return predicates[toInt(n / 10) - 2]
    elif n in 20..99:
        return predicates[toInt(floor(n / 10)) - 2] & digits[(n %% 10) - 1]
    elif n in 100..999:
        var 
            tmp = digits[toInt(floor(n / 100)) - 1] & suffix[toInt(floor(n / 1000))]
        if n %% 100 != 0:
            tmp &= "and"
            tmp &= numToWord(n - 100 *toInt(floor(n / 100)))
        return tmp
    elif n == 1000:
        return digits[0] & suffix[1]

var acc = 0

for elem in 1..1000:
    acc += len(numToWord(elem))

echo(acc)
