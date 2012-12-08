class DisplayWindow < Gosu::Window
  WIDTH = HEIGHT = 640 

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Pathfinding Algorithm Display"
  end
  
  def update
  end
  
  def draw
  end
end
