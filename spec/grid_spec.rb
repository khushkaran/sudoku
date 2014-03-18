require "grid"

describe Grid do
  let(:puzzle) {"015003002000100906270068430490002017501040380003905000900081040860070025037204600"}
  let(:grid) {Grid.new(puzzle)}

  context 'initialization' do
    it "should have 81 cells" do
      expect(grid.cells.flatten.count).to eq(81)
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
        expect(grid.values_in_neighbours_of(30)).to eq([1,2,4,5,7,9].sort)
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

      it 'knows if it is NOT solved' do
        expect(grid.solved?).to eq(false)
      end

      it "knows if it is solved" do
        a_grid = Grid.new("615493872348127956279568431496832517521746389783915264952681743864379125137254698")
        expect(a_grid.solved?).to eq(true)
      end

      it "can count how many outstanding cells there are" do
        expect(grid.cells.flatten.count{|c| !c.filled_out?}).to eq(41)
      end

    end

    context 'grid_inspect' do
      it 'can solve a puzzle' do
        grid.solve
        # grid.grid_inspect
        expect(grid.solved?).to be_true
      end
    end

    context "Hard Puzzles" do
      let(:grid_hard){Grid.new("800000000003600000070090200050007000000045700000100030001000068008500010090000400")}

      it "can solve a hard sudoku" do
        grid_hard.solve
        expect(grid_hard.solved?).to be_true
        # grid_hard.grid_inspect
        p grid_hard.solved_values
      end

      it "can solve another hard sudoku" do
        grid_hard = Grid.new("805000030030900000406030000600010900050308070009040001000020308000009020070000504")
        grid_hard.solve
        expect(grid_hard.solved?).to be_true
        # grid_hard.grid_inspect
        p grid_hard.solved_values
      end

      it "can solve another hard sudoku" do
        grid_hard = Grid.new("014003600500600000007190300800400200060209030001006007006045700000008006009300180")
        grid_hard.solve
        expect(grid_hard.solved?).to be_true
        # grid_hard.grid_inspect
        p grid_hard.solved_values
      end

      it "can solve another hard sudoku" do
        grid_hard = Grid.new("000000000000000000000000000000000000000000000000000000000000000000000000000000000")
        grid_hard.solve
        expect(grid_hard.solved?).to be_true
        # grid_hard.grid_inspect
        p grid_hard.solved_values
      end
    end

    # context "Puzzles" do
    #   it "can do another sudoku" do
    #     grid2 = Grid.new("600108203020040090803005400504607009030000050700803102001700906080030020302904005")
    #     grid2.solve
    #     expect(grid2.solved?).to be_true
    #     grid2.grid_inspect
    #   end
    # end

end


