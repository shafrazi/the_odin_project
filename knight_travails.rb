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
    new_array.uniq
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

  def build_tree(root_cell)
    root = Cell.new(root_cell)
    current_cell = nil
    queue = [root]
    cells = [root_cell]
    while !queue.empty?
      current_cell = queue.shift
      possible_moves(current_cell.value).each do |i|
        if !cells.include?(i)
          child_cell = Cell.new(i)
          queue.push(child_cell)
          cells.push(i)
        end
      end
    end
    cells.length
  end
end

class Cell
  attr_accessor :parent_node, :children, :value

  def initialize(value_array)
    @value = value_array
    @parent_node = nil
    @children = []
  end
end

knight = Knight.new
p knight.possible_moves([0, 0])
p knight.build_tree([3, 3])
