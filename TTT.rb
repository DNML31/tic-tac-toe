class Game
  attr_reader :game_over

  @@game_over = false
  @@board = "\t1 | 2 | 3\n\t--+---+--\n\t4 | 5 | 6\n\t--+---+--\n\t7 | 8 | 9\n"
  @@choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@threes = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], 
    [1, 5, 9], [3, 5, 7]]

  def initialize
    puts "\n#{@@board}"
  end

  def Game.game_over
    @@game_over = false
  end
end

class P1 < Game

  @@p1_choices = []

  def initialize(player, marker)
    @player = player
    @marker = marker
    puts "\n#{@player} enters."
  end

  def mark
    puts "\n#{@player}, mark your square..."
    x = gets.chomp
    @@board = @@board.sub(x, @marker)
    @@choices.delete(x.to_i)
    puts @@board
    @@p1_choices.push(x.to_i)
  end

  def win_check
    if @@threes.include?(@@p1_choices.sort)
      @@game_over = true
      puts "#{@player} wins."
      exit
    elsif @@choices.empty?
      puts 'No more playable squares.'
      exit
    end
  end

end

class P2 < Game

  @@p2_choices = []

  def initialize(player, marker)
    @player = player
    @marker = marker
    puts "\n#{@player} enters."
  end

  def mark
    puts "\n#{@player}, mark your square..."
    x = gets.chomp
    @@board = @@board.sub(x, @marker)
    @@choices.delete(x.to_i)
    puts @@board
    @@p2_choices.push(x.to_i)
  end

  def win_check
    if @@threes.include?(@@p2_choices.sort)
      @@game_over = true
      puts "#{@player} wins."
      exit
    elsif @@choices.empty?
      puts 'No more playable squares.'
      exit
    end
  end
end

def play_game
  game = Game.new

  p1 = P1.new("Player 1", 'X')
  p2 = P2.new("Player 2", 'O')

  loop do
    p1.mark
    p1.win_check
    p2.mark
    p2.win_check
  end
end

play_game
