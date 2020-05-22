require_relative '../lib/board.rb'

game = Board.new
game.welcome_message
game.user_setup
game.start_game
game.turn_count
game.draw_board
game.play
