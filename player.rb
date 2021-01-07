# frozen_string_literal: true

require_relative 'display'

# Gets player input
class Player
  include Display

  def initialize
    puts 'Player has been made'
  end

  def create_code
    Display.code_prompt
    input = gets.chomp
    if valid?(input)
      input
    else
      Display.invalid(input, 'code')
    end
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

  def breaker_win
    Display.player_breaker_win
  end

  def maker_win
    Display.player_maker_win
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
