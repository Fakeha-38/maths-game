# game.rb
require_relative 'player'
require_relative 'question'

class Game
  attr_reader :player1, :player2, :current_player

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1  # Start with player 1
  end

  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def ask_question
    question = Question.new
    puts "#{@current_player.name}, what is #{question.num1} + #{question.num2}?"
    player_answer = gets.chomp.to_i

    if question.check_answer(player_answer)
      puts "Correct!"
      @current_player.increase_score
    else
      puts "Incorrect! The correct answer was #{question.answer}."
      @current_player.eliminate_life
    end
  end

  def check_game_over
    @player1.lives == 0 || @player2.lives == 0
  end

  def display_scores
    puts "#{@player1.name}: #{@player1.lives} lives, #{@player1.score} points"
    puts "#{@player2.name}: #{@player2.lives} lives, #{@player2.score} points"
  end

  def play
    until check_game_over
      ask_question
      display_scores
      switch_turn
    end

    winner = @player1.lives > 0 ? @player1 : @player2
    loser =  winner == @player1 ? @player2 : @player1
    puts "#{winner.name} wins with a score of #{winner.score} - #{loser.score}!"
  end
end
