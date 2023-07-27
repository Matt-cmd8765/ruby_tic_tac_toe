require './lib/game'

# hash to store all moves
hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

game = Game.new
game.info
game.play(hash)