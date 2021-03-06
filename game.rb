# frozen_string_literal: true

require_relative 'player'
require_relative 'computer'
require_relative 'code_checker'
require_relative 'display'

# Handles the flow of the game depending on which version you pick.
class Game
  include Display

  def initialize(mode)
    if mode == 'breaker'
      @breaker = Player.new
      @maker = Computer.new
    else
      @breaker = Computer.new
      @maker = Player.new
    end
    @checker = CodeChecker.new
    @checker.code = @maker.code.split('')
    @turn_count = 0
  end

  def play_turn
    @turn_count += 1
    @guess = @breaker.guess
    @checker.check(@guess)
    return @breaker.breaker_win if @checker.broken
    return @maker.maker_win if @turn_count > 12

    @breaker.feedback(@checker.feedback)
    Display.turns_left(12 - @turn_count)
    play_turn
  end
end
