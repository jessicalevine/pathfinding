class DevWindow < Gosu::Window
  WIDTH = HEIGHT = 640 
  TILESIZE = 32

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Dev Window"

    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", TILESIZE, TILESIZE, {})
    @tile = 0

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @map = Map.from_file("assets/maps/example20square", @tileset)
    @code = nil
    # test_neighbours
    # test_path
  end
  
  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @tile -= 1 if @tile > 0
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @tile += 1
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @tile += 10
    end
    if button_down? Gosu::KbDown then
      @tile -= 10 if @tile > 9
    end
  end
  
  def draw
    @tileset.draw(@tile, WIDTH / TILESIZE / 2, HEIGHT / TILESIZE / 2, 0)
    @font.draw("Tile: #{@tile}", 10, 10, 1, 1.0, 1.0, 0xffffff00)
    @font.draw("Character Code: #{@code}", 10, 30, 1, 1.0, 1.0, 0xffffff00)
  end

  def button_down(id)
    @code = id
  end

  def test_neighbours
    (0...(HEIGHT / TILESIZE)).each do |x|
      (0...(WIDTH / TILESIZE)).each do |y|
        puts "(#{x}, #{y})"
        print "[ "
        @map.neighbours(Location.new(x, y)).each do |n|
          print "(#{n.x}, #{n.y}) "
        end
        puts "]"
      end
    end
  end

  def test_path
    @map.path(Location.new(1, 1), Location.new(10, 5)).each do |n|
    puts "PATH"
      print "(#{n.x}, #{n.y}) "
    end
  end
end
