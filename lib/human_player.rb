require_relative "Player"

class HumanPlayer < Player 
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end
end
