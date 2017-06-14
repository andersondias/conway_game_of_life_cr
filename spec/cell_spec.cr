require "./spec_helper"

describe ConwayGameOfLife::Cell do
  describe "#dead?" do
    it "returns true" do
      cell = ConwayGameOfLife::Cell.new
      cell.dead?.should be_true
    end
  end
end
