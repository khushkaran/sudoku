require_relative './cell'
require_relative './neighbours'

class Grid
  include Neighbours
  attr_accessor :puzzle, :cells

  def initialize(initial_values)
    @puzzle = initial_values
    @cells = create_grid
  end

  def create_grid
    (0..80).map{|i| Cell.new(values_in_neighbours_of(i),puzzle[i].to_i)}.each_slice(9).to_a
  end
  
  def try_to_solve
    cells.flatten.each {|c| c.solve}
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
      update_neighbours
      outstanding = cells.flatten.count {|c| !c.filled_out?}
      looping = outstanding_before == outstanding
      outstanding_before = outstanding
    end
    try_harder unless solved?
  end

  def replicate(board)
    board.new(updated_puzzle)
  end

  def try_harder
    blank_cell = cells.flatten.select{|c| c.value == 0}.first
    if blank_cell != nil
        blank_cell.candidates.each do |candidate|
        blank_cell.assume(candidate)
        board = replicate(self.class)
        board.solve
        @cells = board.cells and return if board.solved?
      end
    end
  end

  def solved?
    cells.flatten.all? {|cell| cell.filled_out? && cell.neighbours.count == 8}
  end

  def end_value_print(i)
    puts "\n-------------------------------------" if i == 0
    print "| #{solved_values[i]} "
    puts "| \n-------------------------------------" if i != 0
  end

  def solved_values
    cells.flatten.map{|cell| ( cell.value == 0 ? " " : cell.value)  }
  end

  def grid_inspect
    81.times { |i| [0,8,17,26,35,44,53,62,71,80].include?(i) ? end_value_print(i) : (print "| #{solved_values[i]} ") }
  end

end