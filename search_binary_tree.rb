array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

class Node
  attr_accessor :parent_node, :left_child, :right_child, :value
  def initialize(value)
    @value = value
    @parent_node = nil
    @left_child = nil
    @right_child = nil
  end
end

def build_tree(array)
  root_node = Node.new(array[0])
  i = 1
  while i < array.length
    node = Node.new(array[i])
    current_node = root_node
    while !node.parent_node
      if node.value > current_node.value
        if !current_node.right_child
          current_node.right_child = node
          node.parent_node = current_node
        else
          current_node = current_node.right_child
        end
      else
        if !current_node.left_child
          current_node.left_child = node
          node.parent_node = current_node
        else
          current_node = current_node.left_child
        end
      end
    end
    i += 1
  end
  root_node
end

p build_tree(array).right_child.right_child.left_child.value


