class ConwayGameOfLife::Population
  def initialize
    @cells = []
  end

  def add_cell(@cell : ConwayGameOfLife::Cell, x, y)
    @cells << @cell
  end

  def next_generation!
  end
end
