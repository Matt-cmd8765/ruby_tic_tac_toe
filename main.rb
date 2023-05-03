# hash to store all moves
board_hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# player options
class Player
  attr_reader :name, :symbol, :player2_symbol

  def initialize(name)
    @name = name
  end

  # ask player 1 if they want to play x's or Os
  def symbol
    @symbol = nil
    until @symbol == 'X' or @symbol == 'O'
      puts "Pick X's or O's"
      sym = gets.chomp
      @symbol = sym.upcase
    end
    @symbol
  end

  # player 2 takes other symbol
  def player2_symbol(player1_symbol)
    player1_symbol == 'X' ? 'O' : 'X'
  end

  # get move
  def move
    puts 'Enter your move'
    gets.chomp
  end
end

# Play the game

class Game 
  # Get info from the players
  def get_info
    puts 'Player 1 name:'
    player1_name = gets.chomp
    puts 'Player 2 name:'
    player2_name = gets.chomp
    player1 = Player.new(player1_name)
    player2 = Player.new(player2_name)
    puts "Player 1 choose X's or O's"
    player1_symbol = player1.symbol
    player2_symbol = player2.player2_symbol(player1_symbol)
  end

  # Shows the Tic-Tac-Toe board
  def show_board(hash)
    puts " #{hash[1]} | #{hash[2]} | #{hash[3]}  "
    puts '---|---|---'
    puts " #{hash[4]} | #{hash[5]} | #{hash[6]}  "
    puts '---|---|---'
    puts " #{hash[7]} | #{hash[8]} | #{hash[9]}  "
  end


  def play

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
      mov = comp.comp_move
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

# Logic to determine winner
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