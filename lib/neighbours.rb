module Neighbours
  ROWS = (0..80).each_slice(9).to_a
  
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

end