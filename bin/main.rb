def welcome_message
  puts "Welcome to Tic Tac Toe Game"
end
# welcome_message

def user_setup
  print "Please Enter Player One name "
  player1 = gets.chomp
  print "Please Enter Player Second name "
  player2 = gets.chomp

  print "Choose #{player1} X or O: "
  mark = gets.chomp
  mark.upcase!
  if mark == "X"
      puts "X is assigned to #{player1} and O is assigned to #{player2}"
  else
      puts "O is assigned to #{player1} and X is assigned to #{player2}"
  end

end

# user_setup

puts "Game Board"
board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def empty_index_board(board, index)
    if board[index] == " " || board[index] == ""
        true
    else
        false    
    end
end

def choose_num1(board)
    
    arr = []

    print "Please User 1 Choose number from 1 to 9: "
    condition = true
    while condition
        
    number1 = gets.to_i
    if number1 <= 9 && number1 > 0 && empty_index_board(board, number1) == true 
        condition = false
        board[number1-1] = "X"
        display_board(board)
    else 
        print "Enter valid number: "        
    end
end
print "Please User 2 Choose number from 1 to 9: "
    condition2 = true
    while condition2
        
    number2 = gets.to_i
    if number2 <= 9 && number2 > 0 && empty_index_board(board, number2) == true && number2 != number1
         condition2 = false
        board[number2-1] = "O"
        display_board(board)
    else 
        print "Enter valid number: "        
    end
end
end


choose_num1(board)
choose_num1(board)
choose_num1(board)
choose_num1(board)

