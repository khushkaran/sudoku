require "./lib/grid"

describe Grid do
  context 'initialization' do
    let(:puzzle) {"015003002000100906270068430490002017501040380003905000900081040860070025037204600"}
    let(:grid) {Grid.new(puzzle)}

    it "should have 81 cells" do
       expect(grid.cells.count).to eq(81)
    end
  end
end