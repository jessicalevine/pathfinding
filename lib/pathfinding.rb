# Require external files
require "gosu"

# Require internal files
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "pathfinding/display_window"

display = DisplayWindow.new
display.show
