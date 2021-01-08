# frozen_string_literal: true

require_relative 'display'
require_relative 'code_checker'

# Picks a code randomly or via algorithm
class Computer
  include Display
  attr_reader :code_space, :code

  def initialize
    create_code_space
    @mini_checker = CodeChecker.new
    @code = @code_space.sample
  end

  def guess
    sleep(1)
    @code = @code_space.sample
    puts @code
    @code
  end

  def create_code_space
    @code_space = []
    i = 1111
    while i < 6667
      (i.to_s.include? '7') ||
        (i.to_s.include? '8') ||
        (i.to_s.include? '9') ||
        (i.to_s.include? '0') ||
        @code_space.push(i.to_s)
      i += 1
    end
  end

  def feedback(feedback)
    @feedback = feedback
    Display.feedback(feedback)
    prune_code_space
  end

  def prune_code_space
    @mini_checker.code = @code
    @code_space.select! do |element|
      @mini_checker.check(element)
      @mini_checker.feedback == @feedback
    end
  end

  def breaker_win
    Display.computer_breaker_win
  end

  def maker_win
    Display.computer_maker_win(@code)
  end
end
