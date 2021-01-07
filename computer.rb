# frozen_string_literal: true

require_relative 'display'

# Picks a code randomly or via algorithm
class Computer
  include Display
  attr_reader :digit_space, :code

  def initialize
    @first_guess = true
    create_digit_space
    @code = ''
    @codes = []
  end

  def create_code
    @code = @digit_space.sample(4)
    @codes.push(@code)
    @code.join
  end

  def guess
    if @first_guess == true
      @first_guess = false
      create_code
    else
      modify_code
    end
    puts @code.join
    @code.join
  end

  def modify_code
    new_code = @code.sample(@feedback[1])
    while new_code.length < 4 do new_code.push(@digit_space.sample) end
    while @codes.include?(new_code) do new_code.shuffle! end
    @code = new_code
  end

  def create_digit_space
    @digit_space = []
    digit = 1
    6.times do
      4.times do
        @digit_space.push(digit.to_s)
      end
      digit += 1
    end 
  end

  def feedback(feedback)
    @feedback = feedback
    Display.feedback(feedback)
    case feedback[1]
    when 0
      remove_digits
    when 4
      keep_digits
    end
  end

  def remove_digits
    digits = @code.uniq
    digits.each do |digit|
      @digit_space.reject! { |element| element == digit }
    end
  end

  def keep_digits
    @digit_space = @code
  end

  def breaker_win
    Display.computer_breaker_win
  end

  def maker_win
    Display.computer_maker_win(@code)
  end
end
