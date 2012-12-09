class DevWindow < Gosu::Window
  WIDTH = HEIGHT = 640 
  TILESIZE = 32

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Dev Window"

    @tileset = Tileset.new(self, "assets/dungeon_crawl_tiles.png", TILESIZE, TILESIZE, {})
    @tile = 0

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
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
  end
end
