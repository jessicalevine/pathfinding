class DevWindow < Gosu::Window
  WIDTH = HEIGHT = 640 

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Dev Window"
  end
  
  def update
  end
  
  def draw
  end
end
