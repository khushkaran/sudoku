require_relative './cell'

class Grid
  ROWS = (0..80).each_slice(9).to_a
  BOX_ROWS = (0..80).each_slice(3).to_a
  attr_reader :cells
  attr_accessor :puzzle

  def initialize(initial_values)
    @puzzle = initial_values
    create_grid
  end

  def create_grid
    @cells = []
    81.times{ |i| @cells << Cell.new(values_in_neighbours_of(i),puzzle[i].to_i); i += 1 }
    @cells = @cells.each_slice(9).to_a
  end

  def boxes
    [0,0,0,6,6,6,12,12,12].map.with_index{|e, i| BOX_ROWS[i+e] + BOX_ROWS[i+e+3] + BOX_ROWS[i+e+6]}
  end

  def values_in_neighbours_of(index)
    unique_neighbours_of(index).map{|neighbour| puzzle[neighbour].to_i}.reject{|neighbour| neighbour == 0}.uniq.sort
  end

  def unique_neighbours_of(index)
    all_neighbours_of(index).reject{|neighbour| neighbour == index}.uniq
  end

  def all_neighbours_of(index)
    current(boxes,index) + current(ROWS,index) + current(ROWS.transpose,index)
  end

  def current(array,index)
    array.detect {|element| element.include?(index)}
  end

  def try_to_solve
    cells.flatten.each {|c| c.solve}
  end

  def update_neighbours    
    self.puzzle = cells.flatten.map {|c| c.value}.join.to_s
    cells.flatten.each_with_index {|cell, i| cell.neighbours = values_in_neighbours_of(i)}
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
  end

  def solved?
    cells.flatten.all? {|cell| cell.filled_out?}
  end

  def end_value_print(i, solved_values)
    puts "\n-------------------------------------" if i == 0
    print "| "
    print "#{solved_values[i]} "
    print "| " if i != 0
    puts "\n-------------------------------------" if i != 0
  end

  def non_end_value_print(i, solved_values)
    print "| "
    print "#{solved_values[i]} "
  end

  def inspect
    solved_values = cells.flatten.map{|cell| cell.value }
    81.times { |i| [0,8,17,26,35,44,53,62,71,80].include?(i) ? end_value_print(i,solved_values) : non_end_value_print(i,solved_values) }
  end

end