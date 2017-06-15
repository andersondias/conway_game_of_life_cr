require "./spec_helper"

describe ConwayGameOfLife::Cell do
  describe "#alive?" do
    it "is alive if alive is true" do
      cell = ConwayGameOfLife::Cell.new(alive: true)
      cell.alive?.should be_true
    end

    it "is not alive if alive is false" do
      cell = ConwayGameOfLife::Cell.new(alive: false)
      cell.alive?.should be_false
    end
  end

  describe "#dead?" do
    it "is dead if alive is false" do
      cell = ConwayGameOfLife::Cell.new(alive: false)
      cell.dead?.should be_true
    end

    it "is not dead if alive is true" do
      cell = ConwayGameOfLife::Cell.new(alive: true)
      cell.dead?.should be_false
    end
  end

  describe "alive!" do
    it "turns a dead cell to life" do
      cell = ConwayGameOfLife::Cell.new(alive: false)
      cell.alive!
      cell.alive?.should be_true
    end
  end

  describe "dead!" do
    it "turns an alive cell to death" do
      cell = ConwayGameOfLife::Cell.new(alive: true)
      cell.dead!
      cell.dead?.should be_true
    end
  end
end
