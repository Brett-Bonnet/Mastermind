require './color.rb'

class Game
  def initialize
    @code = []
    greet
  end

  def greet
    puts "Welcome to Mastermind!"
    puts "Would you like to be the codebreaker (Type 1) or the codemaker (Type 2)"
    @game_type = gets.chomp.to_i
    if @game_type == 1
      play_standard
    elsif @game_type ==2
      play_robot
    end
  end

  def play_standard
    @guess = []
    get_random_code
    counter = 0
    12.times do
      get_guess_from_player
    break if winner?(@guess, @code)
      run_guess_check(@guess, @code)
      if counter == 11
        puts "Better luck next time!"
        play_again?
      end
    counter += 1
    end
  end

  def play_robot
    @player_code = []
    get_code_from_player
    @counter = 0
    12.times do
      @guess = []
      get_guess_from_robot
    break if winner?(@guess, @player_code)
      run_guess_check(@guess, @player_code)
      if @counter == 11
      puts "Better luck next time!"
      play_again?
      end
    @counter += 1
      end
  end

  def get_random_code
    4.times do
      rand_number = rand(1..5)
      @code.push(rand_number)
    end
  end

  def get_code_from_player
    puts "Codemaker, what's the secret code for this round? ***Enter a 4 digit number***"
    @player_code = gets.chomp.to_s.split(//).map{|chr| chr.to_i}
  end

  def get_guess_from_player
    puts "What's the secret code? ***Enter a 4 digit number***"
    @guess = gets.chomp.to_s.split(//).map{|chr| chr.to_i}
  end

  def get_guess_from_robot
    if @counter < 1
      4.times do
        rand_number = rand(1..5)
        @guess.push(rand_number)
      end
    else
      AI_guess(@result_display)
      @guess = @AI_guess
    end      
  end

  def winner?(guess, code)
    if guess == code
      puts "You cracked the code!"
      puts guess.join.green
      play_again?
      true
    else
      false
    end
  end

  def run_guess_check(guess, code)
    answers = []
    @result_display = ''
    guess.each_with_index do |number, index|
      if number == code[index]  
        answers[index] = number.to_s.green
      else if code.include?(number)
        answers[index] = number.to_s.blue
      else answers[index] = number.to_s.red
      end
    end
    end
    @result_display = answers.join
    puts @result_display
  end    

  def play_again?
   puts "Would you like to play again? Type Y/N"
   answer = gets.chomp
   if answer == "Y" || answer == "y"
     Game.new
   elsif answer == "N" || answer == "n"
   end
  end 

  def AI_guess(display)
  @AI_guess = []
  num_match = /^\\e\[\d+m(\d)$/
  puts display
  result = display.split("\e[0m")
  print result

 end
end







play = Game.new








