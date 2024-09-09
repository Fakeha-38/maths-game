# question.rb
class Question
  attr_reader :num1, :num2, :answer

  def initialize
    generate
  end

  def generate
    @num1 = rand(1..20)  # Random number between 1 and 20
    @num2 = rand(1..20)  # Random number between 1 and 20
    @answer = @num1 + @num2
  end

  def check_answer(player_answer)
    player_answer == @answer  # Returns true if the answer is correct
  end
end
