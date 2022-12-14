class Board
  attr_writer :board
  attr_reader :choices

  @@board = "\t1 | 2 | 3\n\t--+---+--\n\t4 | 5 | 6\n\t--+---+--\n\t7 | 8 | 9\n"

  @@choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize()
    puts @@board
  end

  def mark_board(choice, marker)

    if @@choices.include?(choice.to_i)
      @@choices.delete(choice.to_i)
      @@board = @@board.sub(choice, marker)
      puts @@board
    elsif @@choices.empty?
      puts 'No more playable squares.'
      exit
    else
      # something happens here that prevents winning after invalid mark
      puts 'Invalid choice. Choose another.'
      new_choice = gets.chomp
      mark_board(new_choice, marker)
    end
  end

end

class P1 < Board
  attr_reader :board

  def initialize ; end

end

class P2 < Board
  attr_reader :board

  def initialize ; end

end

def intro
  
  puts "Let's play Tic-Tac-Toe! \nP1's marker is X and P2's marker is O."
  puts 'Ready? Y/N'
  
  answer = gets.chomp
  
  if answer == 'y'
    board = Board.new
    play_game
  elsif answer == 'n'
    puts 'Next time then!'
  else
    intro
  end
end

def play_game

  game_won = false

  threes = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], 
    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ]

  p1_squares = []
  p2_squares = []

  while game_won == false do

    puts "\nP1's turn (X). Which square do you want to mark?"

    x = gets.chomp
    p1_squares.push(x.to_i)
    p1_mark = P1.new
    p1_mark.mark_board(x, 'X')

    if threes.include?(p1_squares.sort)
      game_won = true
      puts 'P1 wins.'
      puts 'Play again? Y/N'
      answer = gets.chomp

      if answer == 'y'
        play_game
      else
        break
      end

    else
      game_won = false
      puts "\nP2's turn (O). Which square do you want to mark?"
    end

    y = gets.chomp
    p2_squares.push(y.to_i)
    p2_mark = P2.new
    p2_mark.mark_board(y, 'O')

    if threes.include?(p2_squares.sort)
      game_won = true
      puts 'P2 wins.'
      puts 'Play again? Y/N'
      answer = gets.chomp

      if answer == 'y'
        board = nil
        board = Board.new
        play_game
      else
        break
      end

    else
      game_won = false

    end
  end

end

intro

# array to check for wins
# ex: if a player has markers on [1,2,3] or [1,5,9] in no particular order
# [1,2,3], [4,5,6], [7,8,9] horizontals
# [1,4,7], [2,5,8], [3,6,9] verticals
# [1,5,9], [3,5,7] diagonals

# "When you find that you want the same method to be run on a bunch of different
# objects without having to make a bunch of different if/else or case statements, 
# you should start thinking about using a class."

# store data in hashes, like P1's squares
