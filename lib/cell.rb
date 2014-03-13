class Cell

  attr_accessor :value, :neighbours

  def initialize(neighbours = [], value = 0)
    @neighbours = neighbours
    @value = value
  end

  # returns true if the cell is filled out, false otherwise
  def filled_out?
    # it may be convenient (depending on your design) to use
    # 0 as the "unsolved" value for the cell. This way
    # you won't have to differentiate between numbers and nil
    # values when you calculate neighbours.
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
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
    if !filled_out?
      # do something
      return "Im going to solve myself"
    end
  end

end