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
    @disp_scores = false

    reset
  end
  
  def reset
    @map = Map.from_file(@map_names.first, @tileset)
    @map.units = [ Unit.new("D", @map.rand_walkable_loc, 4, @tileset, @map), 
               Unit.new("A", @map.rand_walkable_loc, 4, @tileset, @map) ]
    @pather = Pather.new(@map, @map.units.first.loc, @map.units.last.loc, @tileset, @disp_scores)
  end

  def update
    if !@paused
      @counter += 1
      if @counter >= @update_frame
        @pather.step if !@pather.finished
        @map.units.each do |u|
          u.step if u.walking?
        end
        @counter = 0
      end
    end
  end
  
  def draw
    @map.draw
    @map.units.map(&:draw)
    @pather.draw
  end

  def button_down(id)
    if id == Gosu::Window.char_to_button_id("r")
      reset
    elsif id == Gosu::Window.char_to_button_id("p")
      @paused = !@paused
    elsif id == Gosu::Window.char_to_button_id("w")
      @map.units.first.walk(@pather.path) if @pather.finished
    elsif id == Gosu::Window.char_to_button_id("d")
      @disp_scores = !@disp_scores
      @pather.disp_scores = @disp_scores
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
