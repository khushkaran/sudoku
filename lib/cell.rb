class Cell

  attr_accessor :value, :neighbours


  def initialize(neighbours = [], value = 0)
    @neighbours = neighbours
    @value = value
  end

  # returns true if the cell is filled out, false otherwise
  def filled_out?
    self.value != 0
  end

  def candidates(puzzle)
    (1...9).to_a - values_in_neighbours(puzzle).uniq
  end

  def values_in_neighbours(puzzle)
    array = []
    neighbours.each{|neighbour|
      array << puzzle[neighbour].to_i if puzzle[neighbour].to_i != 0
    }
    array.sort
  end

  def solve
  end

end