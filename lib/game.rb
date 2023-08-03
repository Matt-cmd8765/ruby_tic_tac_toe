require_relative '../lib/player'

# Play the game
class Game
  attr_accessor :hash
  # Get info from the players
  attr_reader :player1, :player2

  @@win_array = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
  end

  def info
    self.get_names
    puts "#{player1.name} choose X's or O's"
    player1_symbol = player1.player_symbol
    player2.assign_player2_symbol(player1_symbol)
  end

  def get_names
    puts 'Player 1 name:'
    player1_name = gets.chomp
    puts 'Player 2 name:'
    player2_name = gets.chomp
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
  end

  # Shows the Tic-Tac-Toe board
  def show_board(hash)
    puts " #{hash[1]} | #{hash[2]} | #{hash[3]}  "
    puts '---|---|---'
    puts " #{hash[4]} | #{hash[5]} | #{hash[6]}  "
    puts '---|---|---'
    puts " #{hash[7]} | #{hash[8]} | #{hash[9]}  "
  end

  def winner?(hash)
    @@win_array.each do |foo|
      x_array = []
      o_array = []
      foo.each do |bar|
        if hash[bar] == 'X'
          x_array << 'X'
        elsif hash[bar] == 'O'
          o_array << 'O'
        end
        if x_array.length == 3 || o_array.length == 3
          return true
        end
      end
    end
  end

  def tie?(counter)
    counter == 9
  end

  # play function. Should be shorter but I'm learning dammit.
  def play
    show_board(@hash)
    counter = 0
    until winner?(@hash) == true
      player1.move(@hash)
      show_board(@hash)
      counter += 1
      if winner?(@hash) == true
        puts "#{player1.name} wins!"
        break
      end
      if tie?(counter)
        puts 'Tie!'
        break
      end
      player2.move(@hash)
      show_board(@hash)
      counter += 1
      if winner?(@hash) == true
        puts "#{player2.name} wins!"
        break
      end
    end
  end
end
