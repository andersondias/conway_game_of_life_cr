require "./spec_helper"

describe ConwayGameOfLife::Cell do
  describe "#dead?" do
    it "returns true when cell is not alive" do
      cell = ConwayGameOfLife::Cell.new
      cell.dead?.should be_true
    end
  end

  describe "alive!" do
    it "does nothing" do
      cell = ConwayGameOfLife::Cell.new
      cell.alive!
    end
  end
end
