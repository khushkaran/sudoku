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

      it "knows the indexes of a neighbours" do
        expect(grid.unique_neighbours_of(30)).to eq([31,32,39,40,41,48,49,50,27,28,29,33,34,35,3,12,21,57,66,75])
      end

      it "knows the values of a cells neighbours" do
        expect(grid.values_in_neighbours(30)).to eq([1,2,4,5,7,9].sort)
      end
    end

    context 'solutions' do

      it "cells can solve themselves" do
        grid.cells.flatten[72].solve
        expect(grid.cells.flatten[72].value).to eq(1)
      end

      it "can find out if there are a cell is filled out" do
        expect(grid.cells.flatten[72].filled_out?).to eq(false)
      end

      it 'knows if its solved' do
        expect(grid.solved?).to eq(false)
      end

      it "knows if it is solved" do
        grid_that_took_too_long = Grid.new("1"*81)
        expect(grid_that_took_too_long.solved?).to eq(true)
      end

      it "can count how many outstanding cells there are" do
        expect(grid.cells.flatten.count{|c| !c.filled_out?}).to eq(41)
      end

    end

    context 'inspect' do
      it 'can solve a puzzle' do
        grid.solve
        grid.inspect
      end
    end

    # context "Puzzles" do
    #   it "can do another sudoku" do
    #     grid2 = Grid.new("9,0,0,0,0,2,5,0,0,0,0,0,0,0,0,0,9,7,0,0,0,5,0,0,8,0,0,0,0,0,0,0,0,0,2,0,0,0,7,0,6,0,0,0,4,0,9,5,0,1,0,7,0,0,0,0,8,7,0,0,9,0,0,2,0,0,0,0,0,0,0,1,3,0,0,8,0,0,2,0,0")
    #     grid2.solve
    #     grid2.inspect
    #   end

    #   it "can do another sudoku" do
    #     grid2 = Grid.new("6,0,0,1,0,8,2,0,3,0,2,0,0,4,0,0,9,0,8,0,3,0,0,5,4,0,0,5,0,4,6,0,7,0,0,9,0,3,0,0,0,0,0,5,0,7,0,0,8,0,3,1,0,2,0,0,1,7,0,0,9,0,6,0,8,0,0,3,0,0,2,0,3,0,2,9,0,4,0,0,5")
    #     grid2.solve
    #     grid2.inspect
    #   end
    # end

end