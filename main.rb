# hash to store all moves
hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

# player options
class Player
  attr_reader :name, :symbol

  def initialize(name)
    @name = name
  end

  # ask player 1 if they want to play x's or Os
  def player_symbol
    @symbol = nil
    until @symbol == 'X' || @symbol == 'O'
      sym = gets.chomp
      @symbol = sym.upcase
    end
    @symbol
  end

  # player 2 takes other symbol
  def assign_player2_symbol(player1_symbol)
    @symbol = nil
    if player1_symbol == 'X'
      @symbol = 'O'
    elsif player1_symbol == 'O'
      @symbol = 'X'
    end
  end

  # get move
  def move(hash)
    puts "#{@name} enter your move"
    move = gets.chomp
    until hash[move.to_i] != 'X' && hash[move.to_i] != 'O'
      puts 'That square is taken, try again'
      move = gets.chomp
    end
    hash[move.to_i] = @symbol
  end
end

# Play the game
class Game
  # Get info from the players
  attr_reader :player1, :player2

  def info
    puts 'Player 1 name:'
    player1_name = gets.chomp
    puts 'Player 2 name:'
    player2_name = gets.chomp
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    puts "#{player1.name} choose X's or O's"
    player1_symbol = player1.player_symbol
    player2.assign_player2_symbol(player1_symbol)
  end

  # Shows the Tic-Tac-Toe board
  def show_board(hash)
    puts " #{hash[1]} | #{hash[2]} | #{hash[3]}  "
    puts '---|---|---'
    puts " #{hash[4]} | #{hash[5]} | #{hash[6]}  "
    puts '---|---|---'
    puts " #{hash[7]} | #{hash[8]} | #{hash[9]}  "
  end

  # winner logic. Yes it is not DRY but I'm learning dammit
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

  # play function. Should be shorter but I'm learning dammit.
  def play(hash)
    show_board(hash)
    counter = 0
    until winner?(hash)
      player1.move(hash)
      show_board(hash)
      counter += 1
      if winner?(hash)
        puts "#{player1.name} wins!"
        break
      end
      if counter == 9
        puts 'Tie!'
        break
      end
      player2.move(hash)
      show_board(hash)
      counter += 1
      if winner?(hash)
        puts "#{player2.name} wins!"
        break
      end
    end
  end
end

game = Game.new
game.info
game.play(hash)
