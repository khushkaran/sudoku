require_relative './cell'
require_relative './neighbours'

class Grid
  include Neighbours
  
  BOX_ROWS = (0..80).each_slice(3).to_a
  attr_reader :cells
  attr_accessor :puzzle

  def initialize(initial_values)
    @puzzle = initial_values
    @cells = create_grid
  end

  def create_grid
    (0..80).map{|i| Cell.new(values_in_neighbours_of(i),puzzle[i].to_i)}.each_slice(9).to_a
  end

  def boxes
    [0,0,0,6,6,6,12,12,12].map.with_index{|e, i| BOX_ROWS[i+e] + BOX_ROWS[i+e+3] + BOX_ROWS[i+e+6]}
  end
  
  def try_to_solve
    cells.flatten.each {|c| c.solve}
    update_neighbours
  end

  def update_neighbours    
    self.puzzle = updated_puzzle
    cells.flatten.each_with_index {|cell, i| cell.neighbours = values_in_neighbours_of(i)}
  end

  def updated_puzzle
    cells.flatten.map {|c| c.value}.join.to_s
  end

  def solve
    outstanding_before, looping = cells.flatten.count, false
    while !solved? && !looping
      try_to_solve
      outstanding = cells.flatten.count {|c| !c.filled_out?}
      looping = outstanding_before == outstanding
      outstanding_before = outstanding
    end
    try_harder unless solved?
  end

  def blank_cell
    cells.flatten.select{|c| c.value == 0}[0]# select the first unsolved cell
    # by definition, this unsolved cell will have 
    # several possible candidate values
    # Let's explore all of them
  end

  def replicate
    Grid.new(updated_puzzle)
  end

  def steal_solution(board)
    @cells = board.cells
  end

  def try_harder
  blank_cell.candidates.each do |candidate|
    # let this cell assume this value (we're guessing)
    blank_cell.assume(candidate)

    # the key part: we're replicating the board to create
    # the same board but with the value in the 
    # blank_cell fixed
    # It should be a new instance of the Grid class
    # that will be initialised with the current grid
    board = replicate # you need to write this method

    # and now let's see if this grid has a solution
    # This is the recursive bit
    board.solve

    # if it does, then we've got a winner
    # Let's steal the solution from there
    # and pretend we found it ourselves :)
    # Since one of the guesses for blank_cell will be correct
    # one of the boards will actually be solved
    # If none are solved, it means we've got an incorrect
    # guess somewhere up the stack trace
    steal_solution(board) and return if board.solved?

    # puzzle 1
    #ln 1
    #ln 2
    #ln 3 - 2 6s
    #ln 4 - 2 5s
    #ln 5 - 2 2s
    #ln 6 - 2 2s && 2 8s
    #ln 7 - 2 5s
    #ln 8
    #ln 9 - 2 7s

    # puzzle 2
    #ln 1 - 2 6s
    #ln 2 - 2 3s
    #ln 3 - 2 6s && 2 9s
    #ln 4 - 3 4s
    #ln 5 - 
    #ln 6 - 
    #ln 7 - 
    #ln 8 - 2 5s
    #ln 9 - 
  end
end

  def solved?
    cells.flatten.all? {|cell| cell.filled_out?}
  end

  def end_value_print(i)
    puts "\n-------------------------------------" if i == 0
    print "| #{solved_values[i]} "
    puts "| \n-------------------------------------" if i != 0
  end

  def solved_values
    cells.flatten.map{|cell| cell.value }.reject {|e| e == 0}
  end

  def inspect
    81.times { |i| [0,8,17,26,35,44,53,62,71,80].include?(i) ? end_value_print(i) : (print "| #{solved_values[i]} ") }
  end

end