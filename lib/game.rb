require_relative './player.rb'

class Game
  attr_reader :board, :player_x, :player_y, :X, :O
  def initialize(players, board = (1..9).to_a)
    @board = board
    @player_x = Player.new(players)
    @player_y = Player.new(players)
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  def won
    WIN_COMBINATIONS.detect do |combo|
      @board [combo[0]] == @board [combo[1]] &&
        @board [combo[1]] == @board [combo[2]] &&
        full_board?(combo[0])
    end
  end

  def player_index(index, input = :X)
    @board[index] = input
  end

  def full_board?(index)
    @board[index] == :X || @board[index] == :O
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn_player
    @board.select { |i| %i[X O].include?(i) }.size
  end

  def numbers
    @board.select { |i| (1..9).include?(i) }
  end

  def valid_move?(position)
    position.between?(0, 8) && !full_board?(position)
  end

  def full?
    turn_player == 9
  end

  def draw?
    !won && full?
  end

  def end?
    won || full? || draw?
  end

  def current_player
    if turn_player.even?
      :X
    else
      :O
    end
  end

  def winner?
    if @board[won.first] == :X
      :X
    else
      :O
    end
  end

  def game_end
    won || full_board? || game_draw
  end
end
