class DisplayWindow < Gosu::Window
  WIDTH = HEIGHT = 640 
  TILESIZE = 32

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Pathfinding Algorithm Display"

    key = { "A" => 132, "D" => 193, "W" => 1142, "F" => 1156 }
    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", TILESIZE, TILESIZE, key)

    @map = Map.from_file("assets/maps/example20square", @tileset)
    @units = [ Unit.new("A", @map.rand_walkable_loc, 1, @tileset), 
               Unit.new("D", @map.rand_walkable_loc, 1, @tileset) ]
    @path = @map.path(@units.first.loc, @units.last.loc)
  end
  
  def update
  end
  
  def draw
    @map.draw
    @units.map(&:draw)
    @path.each { |loc| @tileset.draw(2, loc.x, loc.y, 1) }
  end
end
