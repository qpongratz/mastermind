# frozen_string_literal: true

require_relative 'player'
require_relative 'computer'
require_relative 'code_checker'
require 'pry'

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
    @checker = CodeChecker.new
    @turn_count = 0
  end

  def play_game
    set_code
  end

  def set_code
    @checker.code = @maker.create_code
    puts @checker.code
  end
end