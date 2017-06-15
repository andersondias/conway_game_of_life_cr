require "./spec_helper"

describe ConwayGameOfLife do
  context "respects first law: any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    context "cell with no live neighbours" do
      it "should be dead in the next generation" do
        population = ConwayGameOfLife::Population.new
        lonely_cell = ConwayGameOfLife::Cell.new(alive: true)

        population.add_cell(lonely_cell, x: 0, y: 0)
        population.next_generation!

        lonely_cell.dead?.should be_true
      end
    end

    context "cell with one live neighbour" do
      it "should be dead in the next generation" do
        population = ConwayGameOfLife::Population.new
        cell = ConwayGameOfLife::Cell.new(alive: true)
        neighbour_cell = ConwayGameOfLife::Cell.new(alive: true)

        population.add_cell(cell, x: 0, y: 0)
        population.add_cell(neighbour_cell, x: 1, y: 0)
        population.next_generation!

        cell.dead?.should be_true
        neighbour_cell.dead?.should be_true
      end
    end
  end

  context "respects second law: any live cell with two or three live neighbours lives on to the next generation" do
    context "cell with two live neighbours" do
      it "should be alive in the next generation" do
        population = ConwayGameOfLife::Population.new
        cell = ConwayGameOfLife::Cell.new(alive: true)
        population.add_cell(cell, x: 2, y: 2)

        cell_at_left = ConwayGameOfLife::Cell.new(alive: true)
        population.add_cell(cell_at_left, x: 1, y: 2)

        cell_at_right = ConwayGameOfLife::Cell.new(alive: true)
        population.add_cell(cell_at_left, x: 3, y: 2)

        population.next_generation!

        cell.alive?.should be_true
        cell_at_left.dead?.should be_true
        cell_at_right.dead?.should be_true
      end
    end
  end
end
