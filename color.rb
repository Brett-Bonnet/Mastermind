class String
    def red;            "\e[31m#{self}\e[0m" end
    def green;          "\e[32m#{self}\e[0m" end
    def blue;           "\e[34m#{self}\e[0m" end
    

    end
    

      #result.each_with_index do |num, index|
   #   if num.include?("32m")
    #    @AI_guess[index] = num.match(num_match)
     # elsif num.include?("31m")
      #  @AI_guess[index] = ([*1..5] - [num.match(num_match)]).sample
      #elsif num.include?("34m")
      #  @AI_guess[index] = num.match(num_match)
      #end
  #end
  #return @AI_guess