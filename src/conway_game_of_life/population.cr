class ConwayGameOfLife::Population
  def initialize
    @cells = Array(ConwayGameOfLife::Cell).new
  end

  def add_cell(cell : ConwayGameOfLife::Cell, x, y)
    @cells << cell
  end

  def cells
    @cells
  end

  def next_generation!
    @cells.each do |cell| cell.dead! end
  end
end
