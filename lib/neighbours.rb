module Neighbours
  ROWS = (0..80).each_slice(9).to_a
  BOX_ROWS = (0..80).each_slice(3).to_a

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

end