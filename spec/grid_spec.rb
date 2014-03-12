require "grid"

describe Grid do
  let(:puzzle) {"015003002000100906270068430490002017501040380003905000900081040860070025037204600"}
  let(:grid) {Grid.new(puzzle)}
    context 'initialization' do

      it "should have 81 cells" do
        cells_count = 0
        grid.cells.each{|row|
          cells_count += row.count
        }
        expect(cells_count).to eq(81)
      end

      it 'should have an unsolved first cell' do
        expect(grid.cells[0][0].filled_out?).to eq(false)
      end

      it 'should have a solved second cell with value 1' do
        expect(grid.cells[0][1].filled_out?).to eq(true)
        expect(grid.cells[0][1].value).to eq(1)
      end
    end

    context 'neighbours' do
      xit "can calculate a neighbour" do
        expect(grid.neighbours_of(13)).to eq([3,4,5,12,14,21,22,23])
      end

      xit 'can calculate another neighbour' do
        expect(grid.neighbours_of(8)).to eq([])
      end
  end

end