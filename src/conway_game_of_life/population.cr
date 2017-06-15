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

        cell_to_the_left = @cells[x-1][y]
        cell_to_the_right = @cells[x+1][y]

        if y > 0
          cell_to_the_top = @cells[x][y-1]
        end

        if y + 1 < @length
          cell_to_the_botton = @cells[x][y+1]
        end

        alive_cells_around_current_cell = 0

        alive_cells_around_current_cell += 1 if cell_to_the_left.alive?
        alive_cells_around_current_cell += 1 if cell_to_the_right.alive?
        alive_cells_around_current_cell += 1 if cell_to_the_top && cell_to_the_top.alive?
        alive_cells_around_current_cell += 1 if cell_to_the_botton && cell_to_the_botton.alive?

        if alive_cells_around_current_cell < 2
          about_to_die << current_cell
        end
      end
    end

    about_to_die.each { |cell| cell.dead! }
  end
end
