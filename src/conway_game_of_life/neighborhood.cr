class ConwayGameOfLife::Neighborhood
  @cells : Array(Array(ConwayGameOfLife::Cell))
  @left : Int32
  @right : Int32
  @top : Int32
  @bottom : Int32

  def initialize(@population : ConwayGameOfLife::Population, @x : Int32, @y : Int32)
    @cells = population.cells_matrix

    @left = @x - 1
    @right = @x + 1 == population.width ? 0 : @x + 1
    @top = @y - 1
    @bottom = @y + 1 == population.length ? 0 : @y + 1
  end

  def all
    neighborhood = Array(ConwayGameOfLife::Cell).new

    neighborhood << @cells[@left][@top]
    neighborhood << @cells[@x][@top]
    neighborhood << @cells[@right][@top]

    neighborhood << @cells[@left][@y]
    neighborhood << @cells[@right][@y]

    neighborhood << @cells[@left][@bottom]
    neighborhood << @cells[@x][@bottom]
    neighborhood << @cells[@right][@bottom]

    neighborhood.uniq
  end

  def alive
    all.compact.select(&.alive?).size
  end
end
