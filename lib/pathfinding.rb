# Require external files
require "gosu"

# Require internal files
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "pathfinding/display_window"

if ARGV.include? "-d"
  require "pathfinding/dev_window"
  window = DevWindow.new
else
  window = DisplayWindow.new
end

window.show
