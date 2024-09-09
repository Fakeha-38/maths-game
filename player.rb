# player.rb
class Player
  attr_reader :name, :lives
  attr_accessor :score

  def initialize(name)
    @name = name
    @lives = 3  # Start with 3 lives
    @score = 0  # Start with a score of 0
  end

  def eliminate_life
    @lives -= 1  # Decrease lives by 1
  end

  def increase_score
    @score += 1  # Increase score by 1
  end
end
