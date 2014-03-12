require_relative './cell'

class Grid
  FORMULA = [-10,-9,-8,-1,1,8,9,10]

  attr_reader :cells

  def initialize(initial_values)
    @cells = [] ; i = 0
    81.times{
      cell = Cell.new
      cell.value = initial_values[i].to_i
      @cells << cell
      i += 1
    }
  end

  def neighbours_of(index)
    FORMULA.map{|adder|index+adder}
  end


  def solve
    # outstanding_before, looping = SIZE, false
    # while !solved? && !looping
    #   try_to_solve # ask each cell to solve itself
    #   outstanding = @cells.count {|c| c.solved?}
    #   looping = outstanding_before == outstanding
    #   outstanding_before = outstanding
    # end
  end

  def solved?
    # a grid if solved if all cells are filled out. Use .all? method
  end

  # def inspect
  #    # iterate over all cells and print the grid
  # end

end