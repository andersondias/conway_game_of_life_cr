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

        left = x - 1
        right = x + 1
        top = y - 1
        bottom = y + 1

        cell_to_the_left = @cells[left][y]
        cell_to_the_right = @cells[right][y]

        if y > 0
          cell_to_the_top = @cells[x][top]
          cell_to_the_top_left = @cells[left][top]
          cell_to_the_top_right = @cells[right][top]
        end

        if y + 1 < @length
          cell_to_the_bottom = @cells[x][bottom]
          cell_to_the_bottom_left = @cells[left][bottom]
          cell_to_the_bottom_right = @cells[right][bottom]
        end

        alive_cells_around_current_cell = 0

        alive_cells_around_current_cell += 1 if cell_to_the_left.alive?
        alive_cells_around_current_cell += 1 if cell_to_the_right.alive?
        alive_cells_around_current_cell += 1 if cell_to_the_top.try(&.alive?)
        alive_cells_around_current_cell += 1 if cell_to_the_top_left.try(&.alive?)
        alive_cells_around_current_cell += 1 if cell_to_the_top_right.try(&.alive?)
        alive_cells_around_current_cell += 1 if cell_to_the_bottom.try(&.alive?)
        alive_cells_around_current_cell += 1 if cell_to_the_bottom_left.try(&.alive?)
        alive_cells_around_current_cell += 1 if cell_to_the_bottom_right.try(&.alive?)

        if alive_cells_around_current_cell < 2
          about_to_die << current_cell
        end
      end
    end

    about_to_die.each(&.dead!)
  end
end
