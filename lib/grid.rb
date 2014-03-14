require_relative './cell'

class Grid
  ROWS = (0...81).each_slice(9).to_a
  attr_reader :cells
  attr_accessor :puzzle

  def initialize(initial_values)
    @puzzle = initial_values
    create_grid
  end

  def create_grid
    @cells = [] ; i = 0
    81.times{ @cells << Cell.new(values_in_neighbours(i),puzzle[i].to_i); i += 1 }
    @cells = @cells.each_slice(9).to_a
  end

  def boxes
    grid_3 = (0...81).each_slice(3).to_a
    increaser = [0,0,0,6,6,6,12,12,12]
    i = 0
    boxes = []
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
    array.detect {|box| box.include?(index)}
  end

  def try_to_solve
    cells.flatten.each {|c| c.solve}
  end

  def update_neighbours
    an_array = []
    cells.flatten.each {|c| an_array << c.value}
    @puzzle = an_array.join.to_s
    cells.flatten.each_with_index {|cell, i| cell.neighbours = values_in_neighbours(i)}
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

  def inspect
    solved_values = []
    cells.flatten.each{|cell|
      solved_values << cell.value
    }
    solved_values
    i = 0
    end_values = [0,8,17,26,35,44,53,62,71,80]
    while i < solved_values.count
      if end_values.include?(i)
        puts "\n-------------------------------------" if i == 0
        print "| "
        print "#{solved_values[i]} "
        print "| " if i != 0
        puts "\n-------------------------------------" if i != 0
        i += 1
      else
        print "| "
        print "#{solved_values[i]} "
        i += 1
      end
    end
  end

end