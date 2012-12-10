class Unit
  attr_accessor :loc

  def initialize(tile, loc, z, tileset, path = nil)
    @tile = tile
    @loc = loc
    @z = z
    @tileset = tileset
    @path = nil
    @walking = false
    @dead = nil
  end

  def walk(path)
    @path = path
    @step_num = 0
    @walking = true
  end

  def walking?
    @walking
  end

  def step
    raise "Please set a path to walk!" if @path.nil?
    if @step_num >= @path.length - 1
      @walking = false
      @dead = true
    else
      warp @path[@step_num]
      @step_num += 1
    end
  end

  def warp(loc)
    @loc = loc
  end

  def move(x, y)
    @loc.x += x
    @loc.y += y
  end

  def draw
    @tileset.draw(@tile, @loc.x, @loc.y, @z)
    @tileset.draw(3, @path.last.x, @path.last.y, 6) if @dead
  end
end
