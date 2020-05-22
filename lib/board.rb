require_relative './game.rb'

class Board < Game
  def initialize
    @game = Game.new(@players)
  end

  def welcome_message
    puts 'Welcome to Tic Tac Toe ! ! !'
    end

  def user_setup
    print 'Player 1: What is your name?:'
    @@player1 = gets.chomp
    @@player1.upcase!
    name = true
    while name
      print 'Player 2: What is your name?:'
      @@player2 = gets.chomp
      @@player2.upcase!
      if @@player2 != @@player1
        name = false
      else
        puts 'Please Choose Different Name'
      end
    end
  end

  def start_game
    puts "X is #{@@player1} and O #{@@player2}"
    puts 'Game Start!'
  end

  def draw_board
    puts " #{@game.board[0]} | #{@game.board[1]} | #{@game.board[2]} "

    puts ' ---------- '

    puts " #{@game.board[3]} | #{@game.board[4]} | #{@game.board[5]} "

    puts ' ---------- '

    puts " #{@game.board[6]} | #{@game.board[7]} | #{@game.board[8]} "
  end

  def turn_count
    player = @game.current_player
    numbers = @game.numbers
    if player == :X
      puts "#{@@player1} it is your turn ! ! !"
    else
      puts "#{@@player2} it is your turn ! ! !"
    end
    puts "Please choose numbers #{numbers}"
  end

  def move
    user_input = gets.strip
    user_input = @game.input_to_index(user_input)
    if @game.valid_move?(user_input)
      @game.player_index(user_input, @game.current_player)
      turn_count
      draw_board
    else
      puts 'You need to enter a valid number between 1-9'
      draw_board
      move
    end
  end

  def play
    move until @game.end?
    if @game.won
      if @game.winner? == :X
        puts "#{@@player1} You won ! ! !"
      else
        puts "#{@@player2} You won ! ! !"
      end
    elsif @game.draw?
      puts 'It is a draw ! ! !'
    end
  end
end
