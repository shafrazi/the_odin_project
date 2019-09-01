class LinkedList
  attr_accessor :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    if @head == nil && @tail == nil
      @head = node
      @tail = node
    else
      self.tail.next_node = node
      self.tail = node
    end
    self.size += 1
  end

  def prepend(node)
    if @head == nil && @tail == nil
      self.append(node)
    else
      node.next_node = self.head
      self.head = node
    end
    self.size += 1
  end
end

class Node
  attr_accessor :next_node, :value
  def initialize(value)
    @next_node = nil
    @value = value
  end
end

node1 = Node.new(1)
node2 = Node.new(2)
node0 = Node.new(0)

linked_list = LinkedList.new
linked_list.append(node1)
linked_list.append(node2)
linked_list.prepend(node0)
p linked_list.size
p linked_list.head.value
p linked_list.tail.value

