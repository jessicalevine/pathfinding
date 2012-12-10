class Tileset
  def initialize(window, filepath, tile_width, tile_height, key)
    @width = tile_width
    @height = tile_height
    @key = key
    @tiles = Gosu::Image::load_tiles(window, filepath, @width, @height, true)
  end

  def get n
    return @tiles[n]
  end

  def draw(n, x, y, z)
    if @key.keys.include? n
      n = @key[n]
    end
    @tiles[n].draw(@width * x, @height * y, z)
  end
end
