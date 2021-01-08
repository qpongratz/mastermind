# frozen_string_literal: true

require_relative 'game'
require_relative 'display'

# Initializes game and can control if another is played
class Main
  def initialize
    Display.introduction
    make_selection
    @game.play_turn
    play_again
  end

  def make_selection
    Display.selection
    answer = gets.chomp
    return @game = Game.new('breaker') if answer == '1'
    return @game = Game.new('maker') if answer == '2'
    return examples if answer == '3'
    return end_game if answer == '4'

    puts "#{answer} is not a valid selection."
    make_selection
  end

  def examples
    Display.examples
    make_selection
  end

  def end_game
    Display.goodbye
    exit
  end

  def play_again
    Display.play_again
    answer = gets.chomp.downcase
    if answer == 'y'
      make_selection
      @game.play_turn
      play_again
    else
      end_game
    end
  end
end

Main.new
