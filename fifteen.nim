from math import floor
from sequtils import foldl

const 
    HEIGHT = 20
    WIDTH = 20
var 
    grid: seq[int] = @[]

proc XYToIX(x: int, y: int): int =
    result = y * WIDTH + x

proc IXToXY(ix: int): seq[int] =
    result = @[]
    var
        y: int = toInt(floor(ix / WIDTH))
        x: int = ix %% WIDTH
    result.add(x)
    result.add(y)

for elem in 0..(HEIGHT * WIDTH):
    grid.add(0)

for ix, elem in grid:
    var
        xy = IXToXY(ix)
        x = xy[0]
        y = xy[1]
    if y == 0 or x == 0:
        grid[ix] = 1
    elif y == x:
        grid[ix] = 2 * grid[XYtoIX(x, y - 1)]
    else:
        grid[ix] = grid[XYtoIX(x - 1, y)] + grid[XYtoIX(x, y - 1)]

echo(foldl(grid, a + b))
