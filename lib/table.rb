class Table

  def initialize(col, row)
    @col = col  #column
    @row = row  #row or line
  end

  #  x and y should be in the table
  def position_is_valid?(position)
    position.x < @col &&
    position.y < @row &&
    position.x >= 0 &&
    position.y >= 0
  end

end