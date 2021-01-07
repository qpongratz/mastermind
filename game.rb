# frozen_string_literal: true

require_relative 'player'
require_relative 'computer'

# Handles the flow of the game depending on which version you pick.
class Game
  def initialize(mode)
    if mode == 'breaker'
      @breaker = Player.new
      @maker = Computer.new
    else
      @breaker = Computer.new
      @maker = Player.new
    end
    @turn_count = 0
  end

end