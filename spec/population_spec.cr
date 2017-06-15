require "./spec_helper"

describe ConwayGameOfLife::Population do
  describe "#cells" do
    it "starts with an empty list of cells" do
      population = ConwayGameOfLife::Population.new
      population.cells.empty?.should be_true
    end
  end

  describe "#add_cell" do
    it "adds cells to population" do
      population = ConwayGameOfLife::Population.new

      cell = ConwayGameOfLife::Cell.new
      population.add_cell(cell, x: 0, y: 0)

      another_cell = ConwayGameOfLife::Cell.new
      population.add_cell(another_cell, x: 0, y: 1)

      population.cells.size.should eq 2
      population.cells.first.should eq cell
      population.cells.last.should eq another_cell
    end
  end

  describe "#next_generation!" do
    it "kills all its cells" do
      population = ConwayGameOfLife::Population.new

      cell = ConwayGameOfLife::Cell.new
      population.add_cell(cell, x: 0, y: 0)

      another_cell = ConwayGameOfLife::Cell.new
      population.add_cell(another_cell, x: 0, y: 1)

      cell.dead?.should be_false
      another_cell.dead?.should be_false

      population.next_generation!

      cell.dead?.should be_true
      another_cell.dead?.should be_true
    end
  end
end
