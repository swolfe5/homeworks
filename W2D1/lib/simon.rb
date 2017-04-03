# hey
class Simon
  COLORS = %w(red blue green yellow).freeze

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      system('clear')
      sleep(1)
      print color
      sleep(2)
    end
  end

  def require_sequence
    guessed = []
    i = 0

    until guessed == seq || game_over
      system('clear')
      puts 'Guess'
      print '> '
      guessed << gets.chomp
      @game_over = true unless guessed.last == seq[i]
      i += 1
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts 'Correct!'
  end

  def game_over_message
    puts "You lose! You made it to round #{sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
