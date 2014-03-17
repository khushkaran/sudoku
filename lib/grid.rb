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
    # try_harder unless solved?
  end

#   def blank_cell
#     cells.flatten.select{|c| c.value == 0}.first# select the first unsolved cell
#     # by definition, this unsolved cell will have 
#     # several possible candidate values
#     # Let's explore all of them
#   end

#   def replicate
#     Grid.new(updated_puzzle)
#   end

#   def steal_solution(board)
#     @cells = board.cells
#   end

#   def try_harder
#   blank_cell.candidates.each do |candidate|
#     blank_cell.assume(candidate)
#     board = replicate
#     board.solve
#     steal_solution(board) and return if board.solved?
#   end
# end

  def solved?
    cells.flatten.all? {|cell| cell.filled_out?}
  end

  def end_value_print(i)
    puts "\n-------------------------------------" if i == 0
    print "| #{solved_values[i]} "
    puts "| \n-------------------------------------" if i != 0
  end

  def solved_values
    cells.flatten.map{|cell| ( cell.value == 0 ? " " : cell.value)  }
     #.reject {|e| e == 0}
  end

  def inspect
    81.times { |i| [0,8,17,26,35,44,53,62,71,80].include?(i) ? end_value_print(i) : (print "| #{solved_values[i]} ") }
  end

end