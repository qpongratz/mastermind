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
    puts Display.guess_prompt
    input = gets.chomp
    if valid?(input)
      input
    else
      guess
    end
  end

  def valid?(input)
    if input
      true
    end
  end
end
