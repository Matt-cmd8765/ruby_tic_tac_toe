board_hash = {}
board_hash[1] = 'X'

# board class
class Board
  def show_board(hash)
    puts " #{hash[1]} | #{hash[2]}  | #{hash[3]} "
    puts "---|---|---"
    puts " #{hash[4]}  | #{hash[5]}  | #{hash[6]} "
    puts "---|---|---"
    puts " #{hash[7]}  | #{hash[8]}  | #{hash[9]} "
  end
end

class Player
  def initialize(symbol)
  end

  def get_move
    gets 
  end
end


board = Board.new
board.show_board(board_hash)