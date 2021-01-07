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
    @checker.code = @maker.create_code.to_a
    @turn_count = 0
  end

  def play_turn
    @turn_count += 1
    @guess = @breaker.guess
    @checker.check(@guess.to_a)
    return @breaker.win if @checker.broken
    return @maker.win if @turn_count > 12

    Display.feedback(@checker.feedback)
    play_turn
  end

end
