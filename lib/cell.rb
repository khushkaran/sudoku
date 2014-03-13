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

  def candidates
    (1...9).to_a - neighbours
  end

  def solve
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
    if !filled_out?
      value = candidates[0] if candidates.count == 1
    end
  end

end