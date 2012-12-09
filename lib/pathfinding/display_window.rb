class DisplayWindow < Gosu::Window
  WIDTH = HEIGHT = 640 
  TILESIZE = 32

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Pathfinding Algorithm Display"

    key = { "A" => 132, "D" => 193, "W" => 1142, "F" => 1156 }
    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", TILESIZE, TILESIZE, key)

    @map = Map.from_file("assets/maps/example20square", @tileset)
    @units = [ Unit.new("A", rand(WIDTH / TILESIZE), rand(HEIGHT / TILESIZE), 1, @tileset), 
               Unit.new("D", rand(WIDTH / TILESIZE), rand(HEIGHT / TILESIZE), 1, @tileset) ]
  end
  
  def update
  end
  
  def draw
    @map.draw
    @units.map(&:draw)
  end
end
