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
<<<<<<< HEAD
      it "can calculate a neighbour" do
        expect(grid.neighbours_of(13)).to eq([3,4,5,12,14,21,22,23])
      end

      xit 'can calculate another neighbour' do
        expect(grid.neighbours_of(8)).to eq([6,7,15,16,17,24,25,26])
=======
      let(:rows) {[[0,1,2,3,4,5,6,7,8],[9,10,11,12,13,14,15,16,17],[18,19,20,21,22,23,24,25,26],[27,28,29,30,31,32,33,34,35],[36,37,38,39,40,41,42,43,44],[45,46,47,48,49,50,51,52,53],[54,55,56,57,58,59,60,61,62],[63,64,65,66,67,68,69,70,71],[72,73,74,75,76,77,78,79,80]]}
      let(:boxes) {[[0,1,2,9,10,11,18,19,20],[3,4,5,12,13,14,21,22,23],[6,7,8,15,16,17,24,25,26],[27,28,29,36,37,38,45,46,47],[30,31,32,39,40,41,48,49,50],[33,34,35,42,43,44,51,52,53],[54,55,56,63,64,65,72,73,74],[57,58,59,66,67,68,75,76,77],[60,61,62,69,70,71,78,79,80]]}

      it "knows which box it is in" do
        expect(grid.current(boxes,30)).to eq([30,31,32,39,40,41,48,49,50])
      end

      it "knows which row it is in" do
        expect(grid.current(rows,30)).to eq([27,28,29,30,31,32,33,34,35])
      end

      it "knows which column it is in" do
        expect(grid.current(rows.transpose,30)).to eq([3,12,21,30,39,48,57,66,75])
      end

      it "knows an indexes neighbours" do
        expect(grid.neighbours_of(30)).to eq([31,32,39,40,41,48,49,50,27,28,29,33,34,35,3,12,21,57,66,75])
>>>>>>> 9f1d1bf7786795978233f04828fd137912b6dc54
      end
  end

end