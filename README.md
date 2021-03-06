# Pathfinding
Pathfinding is a demonstration of the A\* pathfinding algorithm using the Manhattan heuristic, built using the Gosu engine and RLTiles tileset

## Installation
Assuming you have a UNIX-like system, and Ruby installed, use the following sequence of commands to install and run Pathfinding:
```
$ git clone git@github.com:mrjordangoldstein/pathfinding.git
$ pathfinding/bin/pathfinding
```

Tested on Ruby 1.9.3-p194 on Mac OSX Lion.

## Usage
When launched, pathfinding will automatically place a character and a dragon, and begin to visually show the path being drawn found from the dragon to the character.

Aditionally, these controls are available:
* Press `p` to toggle pause on the pathfinding
* Press `r` to reset with new random locations
* Press `w` to walk the dragon along a finalized (golden) path
* Press `d` to toggle display of the manhattan estimates of queued spaces
* Press `m` to cycle through registered maps
* Press `1` through `9` to adjust the animation speed
  * 1 is fastest, 9 is slowest

## Attribution
All the graphic tiles used in this program is the Public domain roguelike tileset "RLTiles". You can find the original tileset at: http://rltiles.sf.net You can find Dungeon Crawl Stone Soup modified tilesets at: http://code.google.com/p/crawl-tiles/downloads/list
