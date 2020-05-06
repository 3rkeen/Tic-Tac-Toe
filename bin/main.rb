puts "Welcome to Tic Tac Toe Game"
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

puts "Game Board"
one = x
puts "-----------"
puts " #{one} | 2 | 3 "
puts "-----------"
puts " 4 | 5 | 6 "
puts "-----------"
puts " 7 | 8 | 9 "
puts "-----------"

def choose_num1
    print "Please User 1 Choose number from 1 to 9: "
    
    condition = true
    while condition
        
    number1 = gets.to_i
    if number1 <= 9 && number1 > 0
        condition = false
        puts "#{number1}: X "
    else 
        print "Enter valid number: "        
    end
end
print "Please User 2 Choose number from 1 to 9: "
    condition2 = true
    while condition2
        
    number2 = gets.to_i
    if number2 <= 9 && number2 > 0 && number2 != number1
        condition2 = false
        puts "#{number2}: O "
    else 
        print "Enter valid number: "        
    end
end
end


choose_num1
choose_num1
choose_num1
choose_num1
