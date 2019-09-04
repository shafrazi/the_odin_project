class Board
  attr_accessor :cells

  def initialize
    @cells = (0..7).to_a.repeated_permutation(2).to_a
  end
end

class Knight
  def possible_moves(array)
    x = array[0]
    y = array[1]
    array = change_cells(x, y)
    new_array = []
    i = 0
    while i < array[0].length
      new_array.push([array[0][i], array[1][0]])
      if array[1][1]
        new_array.push([array[0][i], array[1][1]])
      end
      i += 1
    end
    new_array = new_array + new_array.map { |i| i.reverse }
  end

  def change_cells(x, y)
    array_x = []
    x1 = x + 2
    x2 = x - 2
    array_x.push(x1) if x1 <= 7
    array_x.push(x2) if x2 >= 0

    array_y = []
    y1 = y + 1
    y2 = y - 1
    array_y.push(y1) if y1 <= 7
    array_y.push(y2) if y2 >= 0

    [array_x, array_y]
  end
end

knight = Knight.new
p knight.possible_moves([3, 3])
