class Board
  attr_accessor :cells
  def initialize
    @cells = (0..7).to_a.repeated_permutation(2).to_a
  end
end

class Knight
  
end

board = Board.new
p board.cells.length

def possible_moves(array)
  new_array = []
  x = array[0]
  y = array[1]
  
  x + 2, y + 1, x - 2, y - 1
end
