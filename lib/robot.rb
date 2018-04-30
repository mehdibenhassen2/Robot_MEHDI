class Robot

  attr_accessor :current_position

  def initialize
    @current_position = nil
  end



  # returns current x coordinate, y coordinate and direction in readable format:
  # x, y, f
  def report

    if !placed?
      "    ---------------------------------------------------------------------
    ERROR: your input is invalid, please check your input and the syntax
    ---------------------------------------------------------------------\n"
    else
      [@current_position.x, @current_position.y, @current_position.direction].join(',')
    end
  end
  def placed?
    !@current_position.nil?
  end
end

