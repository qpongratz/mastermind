# frozen_string_literal: true

# Module for displaying text
module Display
  def self.introduction
    puts 'Welcome to Mastermind. A game of code-breaking.'
    puts 'In this version instead of colors, we are using the numbers 1-6'
    puts 'One player will select a four digit code and the other has 12 attempts to break it.'
    puts 'After a guess is given, feedback is returned'
    puts '(~) indicates a digit is correct but in the wrong position.'
    puts '(@) indicates a digit is both correct and in the right position.'
    sleep(3)
  end

  def self.selection
    puts 'Type number for your selection to start'
    puts '1 - Try to crack a computer generated code.'
    puts '2 - Try to stump the computer with a code of your own.'
    puts '3 - See examples of code feedback.'
    puts '4 - Quit'
  end

  def self.examples
    puts 'Suppose the secret code is 1234'
    puts 'If you guessed 1111, your feedback would be (@)'
    puts 'If you guessed 4432, your feedback would be (@) (~) (~)'
    puts 'If you guessed 4321, your feedback would be (~) (~) (~) (~)'
    puts 'And if you guessed 1234, you would win the game.'
    sleep(5)
  end

  def self.play_again
    puts 'Would you like to play another round?'
    puts 'Type "y" for yes and anything else to quit.'
  end

  def self.goodbye
    puts 'Thank you for playing. Have a good day!'
  end

  def self.guess_prompt
    puts 'What do you want your guess to be?'
  end

  def self.code_prompt
    puts 'What secret code do you want the computer to guess?'
  end

  def self.invalid(input, type)
    puts "#{input} is an invalid #{type}."
    puts "Your #{type} should be 4 digits long and each digit should be between 1 and 6 inclusive."
  end

  def self.player_breaker_win
    puts "You've won!"
    puts "You were able to crack the computer's secret code"
  end

  def self.player_maker_win
    puts "You've won!"
    puts 'The computer was not able to break your secret code.'
  end

  def self.computer_breaker_win
    puts "You've lost..."
    puts 'The computer broke your secret code.'
  end

  def self.computer_maker_win(code)
    puts "You've lost..."
    puts "You were not able to break the computer's secret code of #{code}"
  end

  def self.feedback(feedback)
    spot = feedback[0]
    included = feedback[1] - feedback[0]
    displayed = ''
    spot.times { displayed += '(@) ' }
    included.times { displayed += '(~) ' }
    puts displayed
  end

  def self.turns_left(turns)
    if turns == 1
      puts 'One guess remaining.'
    else
      puts "#{turns} guesses remaining."
    end
  end
end
