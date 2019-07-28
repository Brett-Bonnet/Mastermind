require './lib/color.rb'

class Game
  def initialize
    @code = []
    play
  end

  def greet
    puts "Welcome to Mastermind!"
  end

  def play
    @guess = []
    greet
    get_code
    counter = 0
    12.times do
      get_guess
    break if winner?(@guess, @code)
      run_guess_check(@guess, @code)
      if counter == 11
        puts "Better luck next time!"
        play_again?
      end
    counter += 1
    end
  end

  def get_code
    4.times do
      rand_number = rand(1..5)
      @code.push(rand_number)
    end
  end

  def get_guess
    puts "What's the secret code? ***Enter a 4 digit number***"
    @guess = gets.chomp.to_s.split(//).map{|chr| chr.to_i}
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
    result_display = ''
    guess.each_with_index do |number, index|
      if number == code[index]  
        answers[index] = number.to_s.green
      else if code.include?(number)
        answers[index] = number.to_s.blue
      else answers[index] = number.to_s.red
      end
    end
    end
    result_display = answers.join
    puts result_display
  end    

  def play_again?
   puts "Would you like to play again? Type Y/N"
   answer = gets.chomp
   if answer == "Y" || answer == "y"
     Game.new
   elsif answer == "N" || answer == "n"
   end



  end 

end







play = Game.new








