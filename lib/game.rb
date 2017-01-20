require './lib/player'

class Game
  def attack(player)
    player.points -= 10
  end
end
