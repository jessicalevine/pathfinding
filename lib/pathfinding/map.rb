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
    return @tiles[x][y]
  end

  def set(tile, x, y)
    @tiles[x][y] = tile
  end

  def draw
    @tiles.each_with_index do |row, y|
      row.each_with_index do |tile, x|
        @tileset.draw(tile, x, y, 0)
      end
    end
  end
end
