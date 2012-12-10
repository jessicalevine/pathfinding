class DisplayWindow < Gosu::Window
  WIDTH = HEIGHT = 640 
  TILESIZE = 32
  @update_frame = 30

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Pathfinding Algorithm Display"

    key = { "A" => 132, "D" => 193, "W" => 1142, "F" => 1156 }
    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", TILESIZE, TILESIZE, key)

    @map_names = [ "example20square", "20squaremorewalls", "lotsofwalls" ]

    @counter = 0
    @update_frame = 9
    @paused = false

    reset
  end
  
  def reset
    @map = Map.from_file(@map_names.first, @tileset)
    @units = [ Unit.new("D", @map.rand_walkable_loc, 4, @tileset), 
               Unit.new("A", @map.rand_walkable_loc, 4, @tileset) ]
    @pather = Pather.new(@map, @units.first.loc, @units.last.loc, @tileset)
  end

  def update
    if !@paused
      @counter += 1
      if @counter >= @update_frame
        @pather.step if !@pather.finished
        @units.each do |u|
          u.step if u.walking?
        end
        @counter = 0
      end
    end
  end
  
  def draw
    @map.draw
    @units.map(&:draw)
    @pather.draw
  end

  def button_down(id)
    if id == Gosu::Window.char_to_button_id("r")
      reset
    elsif id == Gosu::Window.char_to_button_id("p")
      @paused = !@paused
    elsif id == Gosu::Window.char_to_button_id("w")
      @units.first.walk(@pather.path) if @pather.finished
    elsif id == Gosu::Window.char_to_button_id("d")
      @pather.disp_scores = !@pather.disp_scores
    elsif id == Gosu::Window.char_to_button_id("m")
      @map_names.unshift(@map_names.pop)
      reset
    else
      # On numbers 1 through 9, set update frame to n^2
      # therfore adusting the speed of the animation
      (1..9).each do |n|
        if id == Gosu::Window.char_to_button_id(n.to_s)
          @update_frame = n ** 2
        end
      end # (1..9).each
    end # else
  end
end
