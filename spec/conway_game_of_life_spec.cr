require "./spec_helper"

describe ConwayGameOfLife do
  context "respects first law: any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    context "cell with no live neighbours" do
      it "should be dead in the next generation" do
        population = ConwayGameOfLife::Population.new(length: 2, width: 2)

        lonely_cell = population.find_cell(x: 0, y: 0)
        lonely_cell.alive!

        population.next_generation!

        lonely_cell.dead?.should be_true
      end
    end

    context "cell with one live neighbour" do
      it "should be dead in the next generation" do
        population = ConwayGameOfLife::Population.new(length: 3, width: 3)

        cell = population.find_cell(x: 0, y: 0)
        cell.alive!

        neighbour_cell = population.find_cell(x: 1, y: 0)
        neighbour_cell.alive!

        population.next_generation!

        cell.dead?.should be_true
        neighbour_cell.dead?.should be_true
      end
    end
  end

  context "respects second law: any live cell with two or three live neighbours lives on to the next generation" do
    context "cell with two live neighbours" do
      it "should be alive in the next generation" do
        population = ConwayGameOfLife::Population.new(length: 5, width: 5)

        cell = population.find_cell(x: 2, y: 2)
        cell_at_left = population.find_cell(x: 1, y: 2)
        cell_at_right = population.find_cell(x: 3, y: 2)

        population.next_generation!

        cell.alive?.should be_true
        cell_at_left.dead?.should be_true
        cell_at_right.dead?.should be_true
      end
    end
  end
end
