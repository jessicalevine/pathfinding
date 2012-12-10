class Map
  def self.from_file(filepath, tileset)
    file = File.new(File.expand_path(filepath))
    map_array = []
    while (line = file.gets)
      row = []
      line.strip.split("").each do |c|
        row << c
      end
      map_array << row
    end
    return Map.new(map_array, tileset)
  end

  def initialize(tiles, tileset)
    @tiles = tiles
    @tileset = tileset
  end

  def get(x, y)
    return @tiles[y][x]
  end

  def set(tile, x, y)
    @tiles[y][x] = tile
  end

  def width
    @tiles[0].length
  end

  def height
    @tiles.length
  end

  def draw
    @tiles.each_with_index do |row, y|
      row.each_with_index do |tile, x|
        @tileset.draw(tile, x, y, 0)
      end
    end
  end

  def rand_walkable_loc
    loc = Location.new(rand(width), rand(height))
    while !walkable?(loc)
      loc = Location.new(rand(width), rand(height)) 
    end
    loc
  end

  def path(start, finish)
    open = []
    closed = []
    open.push Location.new(start.x, start.y, 0, manhattan(start, finish), nil)

    current = nil
    while (current = open.pop)
      closed.push(current)
      break if current == finish

      neighbours(current).each do |n|
        next if !walkable?(n) || closed.include?(n) # Skip unwalkable or walked tiles

        # Set G and H scores, as well as parent
        n.dist = current.dist + 10
        n.est = manhattan(n, finish)
        n.parent = current

        #.push to or update open list
        if open.include? n
          # Check if new distance to location n is shorter than existing
          # distance to location. If so, replace it with new location.
          if n.dist < open.fetch(open.index(n)).dist
            open.delete(n)
            open.push(n)
          end
        else
          open.push(n)
        end
      end # neighbours.each

      open.sort!{|a, b| b.score <=> a.score} # Resort open list by heuristic score
    end # while

    #.push each parent to the beginning of the path
    path = [current]
    while (current = current.parent)
      path.unshift(current) 
    end

    path 
  end

  def neighbours n
    ret = []
    x = y = -1

    while true
      # Don't add locations outside map
      if !(n.x + x < 0 || n.y + y < 0 || n.x + x >= width || n.y + y >= height)
        ret << Location.new(n.x + x, n.y + y)
      end

      # Make a square around the location
      if y == -1 && x < 1
        x += 1
      elsif x == 1 && y < 1
        y += 1
      elsif y == 1 && x > -1
        x -= 1
      elsif x == -1 && y > -1
        y -= 1
        return ret if y == -1 # Return upon reaching original location
      end
    end
  end

  def walkable?(n)
    @tiles[n.y][n.x] == "F"
  end

  private

  def manhattan(current, finish)
    (current.x - finish.x).abs + (current.y + finish.y).abs
  end
end
