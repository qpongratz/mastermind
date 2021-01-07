# frozen_string_literal: true

# Module for displaying text
module Display
  def self.guess_prompt
    'What do you want your guess to be?'
  end
  
  def self.invalid(input, type)
    "#{input} is an invalid #{type}."
  end
end