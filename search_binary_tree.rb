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

class BinaryTree
  attr_accessor :size, :root
  def initialize
    @root = nil
    @size = 0
  end

  def build_tree(array)
    @size = array.length
    @root = Node.new(array[0])
    i = 1
    while i < array.length
      node = Node.new(array[i])
      current_node = @root
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
  end

  def breadth_first_search(target)
    queue = []
    i = 0
    current_node = @root
    while i < self.size
      if current_node.value == target
        return current_node
      else
        if current_node.left_child
          queue.push(current_node.left_child)
        end
        if current_node.right_child
          queue.push(current_node.right_child)
        end
        current_node = queue.shift
      end
      i += 1
    end
    return nil
  end

  def depth_first_search(target)
    stack = []
    i = 0
    current_node = @root
    while i < self.size
      if current_node.value == target
        return current_node
      else
        if current_node.right_child
          stack.push(current_node.right_child)
        end
        if current_node.left_child
          stack.push(current_node.left_child)
        end
        current_node = stack.pop
      end
      i += 1
    end
    return nil
  end

  def dfs_rec(target, current_node = @root)
    if current_node.value == target
      return current_node
    else
      if current_node.left_child
        dfs_rec(target, current_node.left_child)
      end
      if current_node.right_child
        dfs_rec(target, current_node.right_child)
      end
    end
  end
end

binary_tree = BinaryTree.new
binary_tree.build_tree(array)
# p binary_tree.breadth_first_search(1)
# p binary_tree.depth_first_search(1)
p binary_tree.dfs_rec(4)