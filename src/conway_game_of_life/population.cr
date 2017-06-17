class ConwayGameOfLife::Population
  def initialize(@width : Int32, @length : Int32)
    @cells = Array(Array(ConwayGameOfLife::Cell)).new

    @width.times do |x|
      @cells << Array(ConwayGameOfLife::Cell).new
      @length.times do
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
    about_to_die = Array(ConwayGameOfLife::Cell).new

    @width.times do |x|
      @length.times do |y|
        current_cell = @cells[x][y]
        next if current_cell.dead?

        neighbourhood = neighbourhood(x, y)
        alive_cells_around_current_cell = neighbourhood.compact.select(&.alive?).size

        if alive_cells_around_current_cell < 2
          about_to_die << current_cell
        end
      end
    end

    about_to_die.each(&.dead!)
  end

  def neighbourhood(x, y)
    left = x - 1
    right = x + 1
    top = y - 1
    bottom = y + 1

    neighbourhood = Array(ConwayGameOfLife::Cell).new

    neighbourhood << @cells[left][y]
    neighbourhood << @cells[right][y]

    if y > 0
      neighbourhood << @cells[x][top]
      neighbourhood << @cells[left][top]
      neighbourhood << @cells[right][top]
    end

    if y + 1 < @length
      neighbourhood << @cells[x][bottom]
      neighbourhood << @cells[left][bottom]
      neighbourhood << @cells[right][bottom]
    end

    neighbourhood
  end
end
