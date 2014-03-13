require_relative './cell'

class Grid
  ROWS = (0...81).each_slice(9).to_a
  attr_reader :cells, :puzzle
  # attr_accessor :puzzle

  def initialize(initial_values)
    @puzzle = initial_values
    @cells = [] ; i = 0
    81.times{ @cells << Cell.new([values_in_neighbours(i)],puzzle[i].to_i); i += 1 }
    @cells = @cells.each_slice(9).to_a
  end

  def boxes
    grid_3 = (0...81).each_slice(3).to_a
    increaser = [0,0,0,6,6,6,12,12,12]; i = 0; boxes = []
    while i < 9 do
      first_index = i+increaser[i]
      boxes << grid_3[first_index] + grid_3[first_index+3] + grid_3[first_index+6]
      i += 1
    end
    boxes
  end

  def values_in_neighbours(index)
    array = []
    neighbours_of(index).each{|neighbour|
      array << puzzle[neighbour].to_i if puzzle[neighbour].to_i != 0
    }
    array.uniq.sort
  end

  def neighbours_of(index)
    result = current(boxes,index) + current(ROWS,index) + current(ROWS.transpose,index)
    result.reject{|neighbour| neighbour == index}.uniq
  end

  def current(array,index)
    array.each{|element|
      return element if element.include?(index)
    }
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