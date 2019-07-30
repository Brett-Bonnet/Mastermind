
module Tools

  def get_random
    array = []
     5.times do
      rand_number = rand(1..5)
      array.push(rand_number)
     end         
    array
  end

  def prompt_code
    puts "Codemaker, what's the secret code for this round? ***Enter a 5 digit number using only numbers [1-5]***"
    @code = gets.chomp.to_s.split(//).map{|chr| chr.to_i}
  end

  def get_guess
  @guess = []
    if @game_type == 1
      prompt_guess
    elsif @game_type == 2
      ai_guess
    end
  end

  def prompt_guess
    puts "What's the secret code? ***Enter a 5 digit number using only numbers [1-5]***"
    @guess_attempt = gets.chomp.to_s.split(//).map{|chr| chr.to_i}
  end

  def valid_guess?(guess)
    if guess.all?{|num| [*1..5].include?(num)} && guess.length == 5
      true
    else
     false
    end
  end

  def check_guess(guess, code)
    answers = []
    @result_display = ''
    guess.each_with_index do |number, index|
      if number === code[index]
        answers[index] = number.to_s.green
      elsif code.include?(number)
        answers[index] = number.to_s.blue
      else answers[index] = number.to_s.red 
      end
    end
  @result_display = answers.join
  puts "#{@result_display}\n"
  end
  
  
  def ai_guess
    @guess_attempt = []
   regex = /m(\d)/
    if @counter < 1
      @guess_attempt = get_random
    else
      result_array = @result_display.split("0m")
        result_array.each_with_index do |item, index|
          if item.include?("32m") #green
            @guess_attempt[index] = item.match(regex)[1].to_i
          elsif item.include?("31m") #red
            @guess_attempt[index] = ([*1..5] - [item.match(regex)[1]]).sample
          elsif item.include?("34m") #blue
            @guess_attempt[index] = ([*1..5] - [item.match(regex)[1]]).sample
          else
          end
        end
     end   
  
  end
end


