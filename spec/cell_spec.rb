require 'cell'

describe Cell do
  let(:puzzle) {"015003002000100906270068430490002017501040380003905000900081040860070025037204600"}
  let(:cell) {Cell.new([30,31,32,40,41,48,49,50,3,12,21,57,66,75,36,37,38,42,43,44],puzzle[39].to_i)}
  it 'cell has 20 neighbours' do
    expect(cell.neighbours.count).to eq(20)
   end

  it  'does not try to solve itself if it is solved' do
    cell = Cell.new([],4)
    expect(cell.solve).to be_nil
  end

  it 'can work out the values in its neighbours' do
    expect(cell.values_in_neighbours(puzzle)).to eq([5,1,4,3,8,1,9,2,2,5].sort)
  end

  it 'can work out the candidates' do
    expect(cell.candidates(puzzle)).to eq([6,7])
  end

  it 'can solve itself if it is empty' do
    expect(cell.solve).to eq("Im going to solve myself")
  end

end