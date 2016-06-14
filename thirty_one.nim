const t = 200

var 
    changeways: array[t + 1, int]
    coinarray: seq[int] = @[1, 2, 5, 10, 20, 50, 100, 200]

changeways[0] = 1
for index1, elem in coinarray:
    for index2 in elem..t:
        changeways[index2] += changeways[index2 - elem]

echo(changeways[high(changeways)])

var 
    change: seq[int] = @[1]

for index1, elem in coinarray:
    for index2 in elem..t:
        if index2 - elem > high(change) or index2 > high(change):
            change.add(1)
        else:
            change[index2] += change[index2 - elem]
echo(change[high(change)])
