require 'cell'

describe Cell do

  let(:cell) {Cell.new}
  context 'with neighbours' do

    it 'cell has neighbours' do
      expect(cell.neighbours.class).to eq(Array)
    end

    it 'can solve itself' do
      
    end


  end
end