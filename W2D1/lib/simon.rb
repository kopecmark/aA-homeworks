require 'byebug'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @sequence_length = 1
    @seq = []
    @user_input = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    system "clear"
    show_sequence

    @seq.length.times do |idx|
      puts @seq[idx]
      sleep(1)
      system "clear"
      puts "Next"
      sleep(1)
      system "clear"
    end
    # debugger
    require_sequence

    if @user_input == @seq
      round_success_message
      sleep(1)
      @sequence_length += 1
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "what was the sequence? (blue,yellow,....)"
    @user_input = gets.chomp.split(",")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You got this round!"
  end

  def game_over_message
    puts "Game over, your memory could use some brain fuel!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
#
# if __FILE__ == $PROGRAM_NAME
#   game = Simon.new
#   game.play
# end
