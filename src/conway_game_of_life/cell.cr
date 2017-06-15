class ConwayGameOfLife::Cell
  @alive : Bool

  def initialize(alive)
    @alive = alive
  end

  def dead?
    !alive?
  end

  def alive?
    @alive
  end

  def dead!
    @alive = false
  end

  def alive!
    @alive = true
  end
end
