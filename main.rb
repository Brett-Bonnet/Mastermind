require './tools.rb'
require './color.rb'
require './code.rb'

class Game
attr_reader :game_type
include Tools

  def initialize
    reset
    greet
    get_code
    play
  end

  def reset
    @game_type = 0
    @code = []
    @guess = []
  end

  def greet
    puts "Welcome to Mastermind!"
    puts "Would you like to be the codebreaker (Type 1) or the codemaker (Type 2)"
    @game_type = gets.chomp.to_i
  end

  def play
    @counter = 0 
    while @counter < 12 do 
      @guess = []
      get_guess
    break if winner?
      check_guess(@guess, @code)
      
    
    
    @counter += 1
    end
  end

  def get_code
    @new_code = Code.new(@game_type)
    @code = @new_code.display
  end

  def winner?
    if @guess == @code
      puts "You cracked the code!"
      puts @guess.join.green
      play_again?
      true
    else
      false
    end
  end

  def play_again?
   puts "Would you like to play again? Type Y/N"
   answer = gets.chomp
   if answer == "Y" || answer == "y"
     Game.new
   elsif answer == "N" || answer == "n"
     abort
   end
  end 

 
end




play = Game.new







