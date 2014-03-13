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

  it 'can work out the candidates' do
    cell = Cell.new([1,2,4,5,7,9],0)
    expect(cell.candidates).to eq([3,6,8])
  end

  it 'skips solving itself if there are more than 1 candidate' do
    cell = Cell.new([1,2,4,5,7,9],0)
    expect(cell.solve).to be_nil
  end
  
  it 'solves itself if there is 1 candidate' do
    cell = Cell.new([9,8,6,3,7,2,4,5],0)
    cell.solve
    expect(cell.value).to eq(1)
  end

end