

class Player

  attr_reader :name, :points

  def initialize(name)
      @name = name
      @points = 100
  end

  def points=(points)
    if points <= 0
      raise("Game Over!")
      @points = 0
    end

    @points = points
  end


end
