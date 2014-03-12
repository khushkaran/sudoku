require 'cell'

describe Cell do

  let(:cell) {Cell.new}
  context 'neighbours' do

    it 'cell has neighbours' do
      expect(cell.neighbours.class).to eq(Array)
    end

    xit 'it knows its neighbours' do
    end


  end
end