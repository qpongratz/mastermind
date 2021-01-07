# frozen_string_literal: true

require_relative 'game'
require_relative 'display'

# Initializes game and can control if another is played
# Display.introduction
# get selection
# if 1 start game as breaker
# if 2 start game as maker
# if help display.rules

testcode = Game.new('maker')
testcode.play_turn
# playcode = Game.new('maker')
# playcode.play_game
