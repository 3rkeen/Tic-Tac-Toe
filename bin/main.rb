def welcome_message
  puts 'Welcome to Tic Tac Toe Game'
  end
welcome_message

def user_setup
  print 'Please Enter Player One name '
  player1 = gets.chomp
  player1.upcase!
  print 'Please Enter Player Second name '
  player2 = gets.chomp
  player2.upcase!

  chosen = true
  while chosen
    print "Choose #{player1} 'X' or 'O': "
    mark = gets.chomp
    mark.upcase!
    if mark == 'X'
      chosen = false
      puts "'X' is assigned to #{player1} and 'O' is assigned to #{player2}"
    elsif mark == 'O'
      chosen = false
      puts "'O' is assigned to #{player1} and 'X' is assigned to #{player2}"
    else

      puts 'Your choise is invalid. Please chhoose again.'
    end
end
end

user_setup

puts 'Game Board'
board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def board_example
  puts ' 1 | 2 | 3 '
  puts '-----------'
  puts ' 4 | 5 | 6 '
  puts '-----------'
  puts ' 7 | 8 | 9 '
end

def empty_index_board(board, index)
  if board[index] == ' ' || board[index] == 'X' || board[index] == 'O'
    true
  else
    false
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index] == 'X' || board[index] == 'O'
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def turn_count(board)
  board.count { |token| token == 'X' || token == 'O' }
end

def choose_message
  print 'Please choose number from 1 to 9: '
end
board_example
def choose_num1(board)
  choose_message
  number1 = gets.to_i
  index = input_to_index(number1)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    print 'Invalid Number. '
    choose_num1(board)
  end
end

choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)

def player_winner; end

puts 'Game over'
puts "#{player_winner} won"
puts 'VWant to play more?'
