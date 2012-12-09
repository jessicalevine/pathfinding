class Unit
  def initialize(tile, x, y, z, tileset)
    @tile = tile
    @x = y
    @y = y
    @z = z
    @tileset = tileset
    puts "#{tile} (#{x}, #{y})"
  end

  def warp(x, y)
    @x = x
    @y = y
  end

  def move(x, y)
    @x += x
    @y += y
  end

  def draw
    @tileset.draw(@tile, @x, @y, @z)
  end
end
