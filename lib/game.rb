

class Game

  def self.start(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.current_game
    @game
  end

  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def computer?
    @current_player.name == 'Computer'
  end

  def current_opponent
  	@current_player == @player1 ? player2 : player1
  end

  def switch_player
  	@current_player == @player1 ? @current_player = player2 : @current_player = player1
  end

  def game_over?
    @player1.dead? || @player2.dead?
  end

end
