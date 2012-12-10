class DisplayWindow < Gosu::Window
  WIDTH = HEIGHT = 640 
  TILESIZE = 32
  UPDATE_FRAME = 30

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Pathfinding Algorithm Display"

    key = { "A" => 132, "D" => 193, "W" => 1142, "F" => 1156 }
    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", TILESIZE, TILESIZE, key)
    @counter = 0

    reset
  end
  
  def reset
    @map = Map.from_file("assets/maps/example20square", @tileset)
    @units = [ Unit.new("A", @map.rand_walkable_loc, 4, @tileset), 
               Unit.new("D", @map.rand_walkable_loc, 4, @tileset) ]
    @pather = Pather.new(@map, @units.first.loc, @units.last.loc, @tileset)
  end

  def update
    @counter += 1
    if @counter >= UPDATE_FRAME
      @pather.step if !@pather.finished
      @counter = 0
    end
  end
  
  def draw
    @map.draw
    @units.map(&:draw)
    @pather.draw
  end
end
