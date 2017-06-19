require "./spec_helper"

describe ConwayGameOfLife::Neighborhood do
  describe "#all" do
    it "returns all cells around the given cell position" do
      population = ConwayGameOfLife::Population.new(width: 4, length: 4)

      neighborhood = ConwayGameOfLife::Neighborhood.new(population, x: 2, y: 1).all
      neighborhood.size.should eq 8

      neighborhood[0].should eq population.find_cell(x: 1, y: 0)
      neighborhood[1].should eq population.find_cell(x: 2, y: 0)
      neighborhood[2].should eq population.find_cell(x: 3, y: 0)
      neighborhood[3].should eq population.find_cell(x: 1, y: 1)
      neighborhood[4].should eq population.find_cell(x: 3, y: 1)
      neighborhood[5].should eq population.find_cell(x: 1, y: 2)
      neighborhood[6].should eq population.find_cell(x: 2, y: 2)
      neighborhood[7].should eq population.find_cell(x: 3, y: 2)
    end
  end

  describe "#alive" do
    it "returns count of all alive cells in the neighborhood" do
      population = ConwayGameOfLife::Population.new(width: 4, length: 4)
      population.find_cell(x: 1, y: 0).alive!
      population.find_cell(x: 3, y: 1).alive!

      neighborhood = ConwayGameOfLife::Neighborhood.new(population, x: 2, y: 1)
      neighborhood.alive.should eq 2
    end
  end
end
