require 'cell'

describe Cell do

  let(:cell) {Cell.new([30,31,32,40,41,48,49,50,3,12,21,57,66,75,36,37,38,42,43,44],0)}
  it 'cell has 20 neighbours' do
    expect(cell.neighbours.count).to eq(20)
  end

  it 'can solve itself if it is empty' do
    expect(cell.solve).to eq("Im going to solve myself")
  end

  it  'does not try to solve itself if it is solved' do
    cell = Cell.new([],4)
    expect(cell.solve).to be_nil
  end
end