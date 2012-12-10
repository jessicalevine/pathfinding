class Unit
  attr_accessor :loc

  def initialize(tile, loc, z, tileset)
    @tile = tile
    @loc = loc
    @z = z
    @tileset = tileset
  end

  def warp(x, y)
    @loc.x = x
    @loc.y = y
  end

  def move(x, y)
    @loc.x += x
    @loc.y += y
  end

  def draw
    @tileset.draw(@tile, @loc.x, @loc.y, @z)
  end
end
