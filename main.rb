# main.rb
require_relative 'player'
require_relative 'question'
require_relative 'game'

# Initialize a new game with two players
game = Game.new("Player 1", "Player 2")

# Start the game
game.play
