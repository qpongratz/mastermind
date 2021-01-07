# frozen_string_literal: true

require_relative 'display'

# Picks a code randomly or via algorithm
class Computer
  include Display

  def initialize
    puts 'Computer has been made'
  end

  def create_code
    code = ''
    4.times { code += rand(1..6).to_s }
    code
  end

  def guess
    # make an algorithm which dictates how computer does its guesses
    '1234'
  end

  def breaker_win
    Display.computer_breaker_win
  end
  
  def maker_win
    Display.computer_maker_win
  end
end