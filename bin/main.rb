def welcome_message
  puts 'Welcome to Tic Tac Toe Game'
  end
welcome_message

def user_setup
  print 'Please Enter Player One name '
  player1 = gets.chomp
  player1.upcase!
  player_name_check = true
  while player_name_check
    print 'Please Enter Player Second name '
    player2 = gets.chomp
    player2.upcase!
    if player2 != player1

      player_name_check = false
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
    else
      puts 'Name is Invalid! '
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
  if turn_count(board).even?
    'X'
  else
    'O'
 end
end

def turn_count(board)
  board.count { |token| token == 'X' || token == 'O' }
end

def choose_message(board)
  if turn_count(board).even?
    print 'Please Player1 Choose number from 1 to 9: '
  else
    print 'Please Player2 Choose number from 1 to 9: '
 end
end
board_example
def choose_num1(board)
  choose_message(board)
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

def full?(board)
  board.all? { |token| token == 'X' || token == 'O' }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_stack = won?(board)
    board[winning_stack.first]
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |stack|
    board[stack[0]] == board[stack[1]] &&
      board[stack[1]] == board[stack[2]] &&
      position_taken?(board, stack[0])
  end
end

def play(board)
  choose_num1(board) until over?(board)
  if won?(board)
    if winner(board) == 'X'
      puts 'Congratulations Player1 !!!'
    else
      puts 'Congratulations Player2 !!!'
    end
  elsif draw?(board)
    puts 'It`s draw!'
  end
end

play(board)
