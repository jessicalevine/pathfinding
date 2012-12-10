class Location
  attr_accessor :x, :y, :dist, :est, :parent

  def initialize(x, y, dist = nil, est = nil, parent = nil)
    @x = x
    @y = y
    @dist = dist
    @est = est
    @parent = parent
  end

  def score
    @dist + @est
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def diagonal?(other)
    (@x - other.x) != 0 && (@y - other.y) != 0
  end
end
