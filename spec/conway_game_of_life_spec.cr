require "./spec_helper"

describe ConwayGameOfLife do
  context "respects first law: any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    context "cell with no live neighbours" do
      it "should be dead in the next generation" do
        population = ConwayGameOfLife::Population.new
        cell = ConwayGameOfLife::Cell.new
        cell.alive!

        cell.dead?.should be_falsey

        population.add_cell(cell, x: 0, y: 0)
        population.next_generation!

        cell.dead?.should be_truthy
      end
    end

    context "cell with one live neighbour" do
      it "should be dead in the next generation" do
        population = ConwayGameOfLife::Population.new
        cell = ConwayGameOfLife::Cell.new
        cell.alive!

        another_cell = ConwayGameOfLife::Cell.new
        another_cell.alive!

        cell.dead?.should be_falsey
        another_cell.dead?.should be_falsey

        population.add_cell(cell, x: 0, y: 0)
        population.add_cell(another_cell, x: 1, y: 0)
        population.next_generation!

        cell.dead?.should be_truthy
        another_cell.dead?.should be_truthy
      end
    end
  end
end
