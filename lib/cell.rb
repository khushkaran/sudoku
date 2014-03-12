class Cell

  attr_accessor :value, :neighbours

  def initialize(neighbours = [])
    @neighbours = neighbours
  end

  # returns true if the cell is filled out, false otherwise
  def filled_out?
    # it may be convenient (depending on your design) to use
    # 0 as the "unsolved" value for the cell. This way
    # you won't have to differentiate between numbers and nil
    # values when you calculate neighbours.
    self.value != 0
  end

  def candidates
    
  end

  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate    
  end

end