require "./spec_helper"

describe ConwayGameOfLife do
  context "respects first law: any live cell with fewer than two live neighbours dies, as if caused by under-population" do
    context "cell with no live neighbours" do
      it "should be dead" do
        cell = ConwayGameOfLife::Cell.new
        cell.dead?.should be_truthy
      end
    end

    context "cell with one live neighbour" do
      it "should be dead" do
        cell = ConwayGameOfLife::Cell.new
        neighbour_cell = ConwayGameOfLife::Cell.new

        cell.dead?.should be_truthy
        neighbour_cell.dead?.should be_truthy
      end
    end
  end
end
