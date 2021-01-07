# frozen_string_literal: true

# Module for displaying text
module Display
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
