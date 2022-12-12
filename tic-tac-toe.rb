class Board
  attr_writer :board

  @@board = "\t1 | 2 | 3\n\t--+---+--\n\t4 | 5 | 6\n\t--+---+--\n\t7 | 8 | 9\n"
  def initialize()
    puts @@board
  end

  def mark
    # replace character in string with gets.chomp from P1 or P2
  end
end

class P1 < Board
  attr_reader :board

  def initialize ; end
  def new_board(num)
    puts @@board.sub(num, 'X') # replace the string character with x = gets.chomp
  end
end

class P2 < Board
  attr_reader :board

  def initialize ; end
  def new_board(num)
    puts @@board.sub(num, 'O') # replace the string character with x = gets.chomp
  end
end

def intro
  puts "Let's play Tic-Tac-Toe! \nP1's marker is X and P2's marker is O."
  puts 'Ready? Y/N'
end

def game_won
#  if player's array = any winning array combo
#    puts player wins
end

def play_game

  board = Board.new
  puts "\nP1's turn (X). Which square do you want to mark?"
  x = gets.chomp
  hey = P1.new
  hey.new_board(x) # replaces board number with marker AND re-put board
  
  puts "\nP2's turn (O). Which square do you want to mark?"
  y = gets.chomp
  what = P2.new
  what.new_board(y)

end

intro
answer = gets.chomp

if answer == 'y'

  play_game

elsif answer == 'n'

  puts 'Next time then!'

else

  intro

end

# array to check for wins
# ex: if a player has markers on [1,2,3] or [1,5,9] in no particular order
# [1,2,3], [4,5,6], [7,8,9] horizontals
# [1,4,7], [2,5,8], [3,6,9] verticals
# [1,5,9], [3,5,7] diagonals

# "When you find that you want the same method to be run on a bunch of different
# objects without having to make a bunch of different if/else or case statements, 
# you should start thinking about using a class."

# store data in hashes, like P1's squares
