class ConwayGameOfLife::Population
  def initialize(width, length)
    @cells = Array(ConwayGameOfLife::Cell).new
    (width * length).times do
      @cells << ConwayGameOfLife::Cell.new(alive: false)
    end
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
