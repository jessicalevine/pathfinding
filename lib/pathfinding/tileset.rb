class Tileset
  def initialize(window)
    @tiles = Gosu::Image::load_tiles(window, "assets/dungeon_crawl_tiles.png", 32, 32, true)
  end

  def get n
    return @tiles[n]
  end

  def draw(n, x, y, z)
    @tiles[n].draw(x, y, z)
  end
end
