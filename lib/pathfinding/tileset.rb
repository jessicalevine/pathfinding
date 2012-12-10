class Tileset
  MARGIN = 4

  def initialize(window, filepath, tile_width, tile_height, key)
    @width = tile_width
    @height = tile_height
    @key = key
    @tiles = Gosu::Image::load_tiles(window, filepath, @width, @height, true)
    @font = Gosu::Font.new(window, Gosu::default_font_name, 20)
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

  def write(text, x, y, z)
    @font.draw(text, MARGIN + @width * x, MARGIN + @height * y, z)
  end
end
