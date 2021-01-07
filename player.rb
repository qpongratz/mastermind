# frozen_string_literal: true

require_relative 'display'

# Gets player input
class Player
  include Display

  def initialize
    puts 'Player has been made'
  end

  def create_code
    'playercode'
  end

  def guess
    Display.guess_prompt
    input = gets.chomp
    if valid?(input)
      input
    else
      Display.invalid(input, 'guess')
      guess
    end
  end

  def valid?(input)
    if input.length == 4 &&
       input[0].between?('1', '6') &&
       input[1].between?('1', '6') &&
       input[2].between?('1', '6') &&
       input[3].between?('1', '6')
      true
    else
      false
    end
  end
end

# Define special methods if player is the code maker
class PlayerMaker < Player
  def win
    Display.player_maker_win
  end
end

# Define special methods if player is the code breaker
class PlayerBreaker < Player
  def win
    Display.player_breaker_win
  end
end
