
class Code
include Tools

  def initialize(game_type)
    reset
    get_code(game_type)
  end

  def reset
    @code = []
  end

  def get_code(game_type)
    if game_type == 1
       @code = get_random
    elsif game_type == 2
      prompt_code
    end
  end

  def display
    @code
  end

end
