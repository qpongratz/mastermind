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
    @checker.code = @maker.create_code
    @turn_count = 0
  end

  def play_game
    @guess = @breaker.guess
    puts @guess
    # @checker.check_guess(guess)
    # if not win, display feedback
    # increment turn count
    # if not loss, repeat
  end


end
