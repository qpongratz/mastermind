# frozen_string_literal: true

require 'pry'

# Checks code given against saved code and gives feedback
class CodeChecker
  attr_accessor :code
  attr_reader :broken, :feedback

  def initialize
    @broken = false
    @feedback = [0, 0]
  end

  def check(guess)
    guess_array = guess.split('')
    if guess_array == code
      @broken = true
    else
      @feedback = [0, 0]
      correct_spot(guess_array)
      correct_elements(guess_array)
    end
  end

  private

  def correct_spot(guess)
    guess.each_with_index do |element, index|
      @feedback[0] += 1 if element == code[index]
    end
  end

  def correct_elements(guess)
    digits = tally(guess)
    digits.each do |digit, frequency|
      in_code = code.count(digit)
      @feedback[1] += (frequency < in_code ? frequency : in_code) 
    end
  end

  def tally(array)
    array.reduce({}) do |hash, element|
      if hash[element]
        hash[element] += 1
      else 
        hash[element] = 1
      end
      hash
    end
  end
end
