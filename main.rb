# frozen_string_literal: true

require_relative 'game'
require_relative 'display'

# Initializes game and can contrl if another is played
compcode = Game.new('breaker')
compcode.play_game
# playcode = Game.new('maker')
# playcode.play_game
