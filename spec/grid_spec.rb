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
      it "knows which box it is in" do
        expect(grid.current_box(30)).to eq([30,31,32,39,40,41,48,49,50])
      end

      it "knows which row it is in" do
        expect(grid.current_row(30)).to eq([27,28,29,30,31,32,33,34,35])
      end

      it "knows which column it is in" do
        expect(grid.current_column(30)).to eq([3,12,21,30,39,48,57,66,75])
      end

      it "knows an indexes neighbours" do
        expect(grid.neighbours_of(30)).to eq([30,31,32,39,40,41,48,49,50,27,28,29,33,34,35,3,12,21,57,66,75])
      end
  end

end