# hash to store all moves
board_hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# board class
class Board
  def show_board(hash)
    puts " #{hash[1]} | #{hash[2]} | #{hash[3]}  "
    puts '---|---|---'
    puts " #{hash[4]} | #{hash[5]} | #{hash[6]}  "
    puts '---|---|---'
    puts " #{hash[7]} | #{hash[8]} | #{hash[9]}  "
  end
end

# player and computer options
class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def symbol
    symbol = nil
    until symbol == 'X' or symbol == 'O'
      puts 'Pick Xs or Os'
      sym = gets.chomp
      symbol = sym.upcase
    end
    symbol
  end

  def comp_symbol(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end

  def move
    puts 'Enter your move'
    gets.chomp
  end

  def comp_move
    rand(1..9)
  end
end

def game(hash)
  puts "Let's play Tic-Tac-Toe!"
  puts 'First tell me your name!'
  player_name = gets.chomp
  board = Board.new
  matt = Player.new(player_name)
  comp = Player.new('Computer')
  symbol = matt.symbol
  sym = comp.comp_symbol(symbol)
  board.show_board(hash)

  until winner?(hash)
    move = matt.move
    until hash[move.to_i] != 'X' && hash[move.to_i] != 'O'
      move = matt.move
    end
    hash[move.to_i] = symbol
    if winner?(hash)
      board.show_board(hash)
      puts '#########################'
      puts "#{matt.name} wins!!!!"
      puts '#########################'
      break
    end
    mov = comp.comp_move
    until hash[mov.to_i] != 'X' && hash[mov.to_i] != 'O'
      move = mov = comp.comp_move
    end
    hash[mov.to_i] = sym
    board.show_board(hash)
    if winner?(hash)
      puts ':(:(:(:(:(:(:(:(:(:('
      puts "#{comp.name} wins... Better luck next time!"
      puts ':(:(:(:(:(:(:(:(:(:('
      break
    end
  end
end

def winner?(hash)
  if hash[1] == 'X' && hash[2] == 'X' && hash[3] == 'X'
    true
  elsif hash[4] == 'X' && hash[5] == 'X' && hash[6] == 'X'
    true
  elsif hash[7] == 'X' && hash[8] == 'X' && hash[9] == 'X'
    true
  elsif hash[1] == 'X' && hash[4] == 'X' && hash[7] == 'X'
    true
  elsif hash[2] == 'X' && hash[5] == 'X' && hash[8] == 'X' 
    true
  elsif hash[3] == 'X' && hash[6] == 'X' && hash[9] == 'X'
    true
  elsif hash[1] == 'X' && hash[5] == 'X' && hash[9] == 'X'
    true
  elsif hash[3] == 'X' && hash[5] == 'X' && hash[7] == 'X'
    true
  elsif hash[1] == 'O' && hash[2] == 'O' && hash[3] == 'O'
    true
  elsif hash[4] == 'O' && hash[5] == 'O' && hash[6] == 'O'
    true
  elsif hash[7] == 'O' && hash[8] == 'O' && hash[9] == 'O'
    true
  elsif hash[1] == 'O' && hash[4] == 'O' && hash[7] == 'O'
    true
  elsif hash[2] == 'O' && hash[5] == 'O' && hash[8] == 'O'
    true
  elsif hash[3] == 'O' && hash[6] == 'O' && hash[9] == 'O'
    true
  elsif hash[1] == 'O' && hash[5] == 'O' && hash[9] == 'O'
    true
  elsif hash[3] == 'O' && hash[5] == 'O' && hash[7] == 'O'
    true
  end
end

game(board_hash)