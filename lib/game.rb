require './lib/player'

class Game
  attr_reader :player_1, :player_2, :active_player, :not_active_player

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end
  
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @active_player = player_1
    @not_active_player = player_2
  end

  def player_attack
    not_active_player.points -= 10
  end

  def change_turn
    if @active_player == @player_1
      @active_player = @player_2
      @not_active_player = @player_1
    else
      @active_player = @player_1
      @not_active_player = @player_2
    end
  end
end
