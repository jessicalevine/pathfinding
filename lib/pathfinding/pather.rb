class Pather
  attr_accessor :finished, :path
  
  def initialize(map, start, finish, tileset)
    @map = map
    @start = start
    @finish = finish
    @tileset = tileset
    @open = [ Location.new(start.x, start.y, 0, manhattan(start, finish), nil) ]
    @closed = []
    @current = nil
    @finished = false
    @path = []
  end

  def step
    return if @open.empty? || @finished
    @current = @open.pop
    @closed.push(@current)
    if @current == @finish
      @path.unshift @current
      while (@current = @current.parent)
        @path.unshift @current
      end
      @finished = true
      return
    end

    @map.neighbours(@current).each do |n|
      next if !@map.walkable?(n) || @closed.include?(n) # Skip unwalkable or walked tiles

      # Set G and H scores, as well as parent
      if @current.diagonal? n
        n.dist = @current.dist + 14
      else
        n.dist = @current.dist + 10
      end
      n.est = manhattan(n, @finish)
      n.parent = @current

      #.push to or update @open list
      if @open.include? n
        # Check if new distance to location n is shorter than existing
        # distance to location. If so, replace it with new location.
        if n.dist < @open.fetch(@open.index(n)).dist
          @open.delete(n)
          @open.push(n)
        end
      else
        @open.push(n)
      end
    end # neighbours.each

    # Resort @open list by heuristic score
    # Sorts greatest to least, then pops from end
    @open.sort!{|a, b| b.est <=> a.est} 
  end

  def draw
    @open.each { |n| @tileset.draw(2714, n.x, n.y, 1) }
    @closed.each { |n| @tileset.draw(2717, n.x, n.y, 2) }
    @tileset.draw(10, @current.x, @current.y, 4) if @current
    if @finished
      @path.each { |n| @tileset.draw(2719, n.x, n.y, 3) }
    end
  end

  private

  def manhattan(current, finish)
    (current.x - finish.x).abs + (current.y - finish.y).abs
  end
end
