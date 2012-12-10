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
end
