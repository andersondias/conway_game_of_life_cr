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

  def cells_matrix
    @cells
  end

  def cells
    @cells.flatten
  end

  def size
    cells.size
  end

  def width
    @width
  end

  def length
    @length
  end

  def next_generation!
    about_to_die = Array(ConwayGameOfLife::Cell).new
    about_to_live = Array(ConwayGameOfLife::Cell).new

    width.times do |x|
      length.times do |y|
        current_cell = @cells[x][y]

        neighborhood = ConwayGameOfLife::Neighborhood.new(self, x, y)
        alive_cells_around_current_cell = neighborhood.alive

        if current_cell.alive? && ![2,3].includes?(alive_cells_around_current_cell)
          about_to_die << current_cell
        elsif alive_cells_around_current_cell == 3
          about_to_live << current_cell
        end
      end
    end

    about_to_die.each(&.dead!)
    about_to_live.each(&.alive!)
  end
end
