require './lib/player'

class Game
  attr_accessor :player_1, :player_2
  def attack(player)
    player.points -= 10
  end
end
