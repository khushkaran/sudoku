require_relative './cell'

class Grid
  BOXES = [
      [0,1,2,9,10,11,18,19,20],
      [3,4,5,12,13,14,21,22,23],
      [6,7,8,15,16,17,24,25,26],
      [27,28,29,36,37,38,45,46,47],
      [30,31,32,39,40,41,48,49,50],
      [33,34,35,42,43,44,51,52,53],
      [54,55,56,63,64,65,72,73,74],
      [57,58,59,66,67,68,75,76,77],
      [60,61,62,69,70,71,78,79,80]
    ]

  ROWS = [
    [0,1,2,3,4,5,6,7,8],
    [9,10,11,12,13,14,15,16,17],
    [18,19,20,21,22,23,24,25,26],
    [27,28,29,30,31,32,33,34,35],
    [36,37,38,39,40,41,42,43,44],
    [45,46,47,48,49,50,51,52,53],
    [54,55,56,57,58,59,60,61,62],
    [63,64,65,66,67,68,69,70,71],
    [72,73,74,75,76,77,78,79,80]
  ]

  attr_reader :cells

  def initialize(initial_values)
    @cells = [] ; i = 0
    81.times{
      cell = Cell.new([neighbours_of(i)],initial_values[i].to_i)
      @cells << cell
      i += 1
    }
    @cells = @cells.each_slice(9).to_a
  end

  def neighbours_of(index)
    # result = current_box(index) + current_row(index) + current_column(index)
    result = current(BOXES,index) + current(ROWS,index) + current(ROWS.transpose,index)
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