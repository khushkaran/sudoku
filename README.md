Sudoku
--
Week 4 project @makersacademy, set by @shadchnev, was to
develop a Sudoku solver. It needs to be able to solve the
puzzle and print the solved grid. The rules of sudoku are
simple enough, each 9 x 9 grid is split into 9 smaller
3 x 3 grids. Each smaller grid needs to have the numbers
from 1-9 in them, however so does each row or column, and
they cannot have duplicates within them.

### Technologies
* Ruby
* Git
* Object-oriented-programming
* Test-driven-development with RSpec

### Instructions
To run the application run `irb`:

```ruby
require "./lib/grid"
=> true
grid = Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
=> ...
grid.solve
=> nil
grid.solved?
=> true
grid.grid_inspect
-------------------------------------
| 6 | 1 | 5 | 4 | 9 | 3 | 8 | 7 | 2 |
-------------------------------------
| 3 | 4 | 8 | 1 | 2 | 7 | 9 | 5 | 6 |
-------------------------------------
| 2 | 7 | 9 | 5 | 6 | 8 | 4 | 3 | 1 |
-------------------------------------
| 4 | 9 | 6 | 8 | 3 | 2 | 5 | 1 | 7 |
-------------------------------------
| 5 | 2 | 1 | 7 | 4 | 6 | 3 | 8 | 9 |
-------------------------------------
| 7 | 8 | 3 | 9 | 1 | 5 | 2 | 6 | 4 |
-------------------------------------
| 9 | 5 | 2 | 6 | 8 | 1 | 7 | 4 | 3 |
-------------------------------------
| 8 | 6 | 4 | 3 | 7 | 9 | 1 | 2 | 5 |
-------------------------------------
| 1 | 3 | 7 | 2 | 5 | 4 | 6 | 9 | 8 |
-------------------------------------
```

### Issues
* It can't solve more difficult puzzles, this feature needs
to be added.
