def intro
  puts "Let's play Tic-Tac-Toe! \nP1's marker is X and P2's marker is O."
  puts "Ready? Y/N"
end

intro()

answer = gets.chomp
board = nil

def play_game()
  puts "\nP1's turn (X). Which square do you want to mark?"
  gets.chomp
end

if answer == "y"
  board = "\t1 | 2 | 3\n\t--+---+--\n\t4 | 5 | 6\n\t--+---+--\n\t7 | 8 | 9\n"
  puts board
  play_game()


elsif answer == "n"
  puts "Next time then!"
else
  intro()
end



class Marker
  def add_mark
  end
end

class P1 < Marker
  def initialize
  end
end

class P2 < Marker
  def initialize
  end
end