class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    while @game_over != false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    puts "3"
    sleep 1
    puts "2"
    sleep 1    
    puts "1"
    sleep 1
    system("clear")
    @seq.each do |color|
      puts color
      sleep 0.5
      system("clear")
      sleep 0.5
    end
  end

  def require_sequence
    @seq.each do |color|
      user_color = gets.chomp
      if color != user_color
        @game_over = true
        break
      end
    end
    sleep 0.5
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    puts "YOU MADE IT!"
  end

  def game_over_message
    puts "GG. You made it #{@sequence_length-1} rounds."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

s = Simon.new
s.play