class DisplayWindow < Gosu::Window
  WIDTH = HEIGHT = 640 

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Pathfinding Algorithm Display"

    key = { "W" => 1142, "F" => 1156 }
    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", 32, 32, key)

    @map = Map.from_file("assets/maps/example20square", @tileset)
  end
  
  def update
  end
  
  def draw
    @map.draw
  end
end
