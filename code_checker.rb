# frozen_string_literal: true

# Checks code given against saved code and gives feedback
class CodeChecker
  attr_accessor :code 
  attr_reader :win, :feedback

  def initialize
    @win = false
    @feedback = [0, 0]
  end

  def check(guess)
    if guess == code
      @win = true
    else
      @feedback = [0, 0]
      correct_spot(guess)
      correct_elements(guess)
      p @feedback
    end
  end

  private

  def correct_spot(guess)
    guess.each_with_index do |element, index|
      @feedback[0] += 1 if element == code[index]
    end
  end

  def correct_elements(guess)
    digits = guess.tally
    digits.each do |digit, frequency|
      in_code = code.count(digit)
      @feedback[1] += (frequency < in_code ? frequency : in_code) 
    end
  end

end
