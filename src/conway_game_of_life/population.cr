class ConwayGameOfLife::Population
  def initialize(width, length)
    @cells = Array(Array(ConwayGameOfLife::Cell)).new
    width.times do |x|
      @cells << Array(ConwayGameOfLife::Cell).new
      length.times do
        @cells[x] << ConwayGameOfLife::Cell.new(alive: false)
      end
    end
  end

  def find_cell(x, y)
    @cells[x][y]
  end

  def cells
    @cells.flatten
  end

  def size
    cells.size
  end

  def next_generation!
    cells.each { |cell| cell.dead! }
  end
end
