
module Tools

  def get_random
    array = []
     4.times do
      rand_number = rand(1..5)
      array.push(rand_number)
     end         
    array
  end

  def prompt_code
    puts "Codemaker, what's the secret code for this round? ***Enter a 4 digit number***"
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
    puts "What's the secret code? ***Enter a 4 digit number***"
    @guess = gets.chomp.to_s.split(//).map{|chr| chr.to_i}
  end

  def check_guess
    answers = []
    @result_display = ''
    @guess.each_with_index do |number, index|
      if number == @code[index]  
        answers[index] = number.to_s.green
      else if @code.include?(number)
        answers[index] = number.to_s.blue
      else answers[index] = number.to_s.red
      end
    end
    end
    @result_display = answers.join
    puts @result_display 
  end
  
  
  def ai_guess
    @guess = []
   regex = /\\e\[\d+m(\d)\\e\[/
    
    if @counter < 1
      @guess = get_random
      print @guess
    else
      result_array = @result_display.split("0m")
       print result_array
        result_array.each_with_index do |item, index|
        
  

        
        end
     end   
  
  end



end
