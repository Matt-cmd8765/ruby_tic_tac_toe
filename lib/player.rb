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
      puts 'Only Xs or Os!' unless sym == 'X' || sym == 'O'
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

  def valid_move?(move)
  end

  # get move
  def move(hash)
    puts "#{@name} enter your move"
    move = gets.chomp
    until move.to_i >= 1 && move.to_i <=9
      puts 'Please input a number between 1 and 9'
      move = gets.chomp
    end
    until hash[move.to_i] != 'X' && hash[move.to_i] != 'O'
      puts 'That square is taken, try again'
      move = gets.chomp
    end
    hash[move.to_i] = @symbol
  end
end