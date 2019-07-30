
require './tools.rb'
require './color.rb'
require './code.rb'

class Game
attr_reader :game_type
include Tools

  def initialize
    reset
    greet
  end

  def reset
    @game_type = 0
    @code = []
    @guess = []
  end

  def greet
    puts "Welcome to Mastermind!"
    puts "Mastermind is a code-breaking game designed for two players."
    puts "The Codemaker creates a secret code (in this version, a 5 digit number consisting of numbers 1-5) and the codebreaker has 12 attempts to crack the code"
    puts "After making a guess, the codebreaker will receive clues as to which parts are correct and which are wrong:\n\n"
    puts "Numbers in \e[32mgreen\e[0m are correct!" 
    puts "Numbers in \e[31mred\e[0m are incorrect"
    puts "Numbers in \e[34mblue\e[0m are part of the secret code, however in a different place.\n\n"
    get_game_type
  end
  def get_game_type
    puts "*************************************************************************"
    puts "First, you'll need to pick whether you will play as the codebreaker, or the codemaker!"
    puts "Would you like to be the codebreaker (Type 1) or the codemaker (Type 2)"
  i = 0  
  while i < 5 do
     @game_type = gets.chomp.to_i
     if @game_type == 1 || @game_type == 2
      get_code   
     else puts "That's not a valid game type! Type 1 or 2 and press enter to play."
       i += 1
       redo
     end
  end
  end

  def play
    @counter = 0 
    while @counter < 12 do 
      @guess = []
      get_guess
     if valid_guess?(@guess_attempt)
       @guess = @guess_attempt
     else puts "That's not a valid guess! Try again!"
     redo
     end
    break if winner?
      check_guess(@guess, @code)
    if @counter == 11
    puts "Better luck next time!"
    play_again?
    end
    @counter += 1
    end
  end

  def get_code
    @new_code = Code.new(@game_type)
    @code = @new_code.display
    play
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



