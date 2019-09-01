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
      node.next_node = nil
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

  def at(index)
    i = 0
    node = self.head
    while i < index
      node = node.next_node
      i += 1
    end
    node
  end

  def pop
    if self.tail
      self.tail = self.at(self.size-2) 
      self.tail.next_node = nil
      self.size -= 1
    end
  end

  def contains?(value)
    i = 0
    while i < self.size
      node = self.at(i)
      if node.value == value
        return true
      end
      i += 1
    end
    return false
  end

  def find(data)
    i = 0
    while i < self.size
      node = self.at(i)
      if node.value == data
        return i
      end
      i += 1
    end
    return nil
  end

  def to_s
    array = []
    i = 0
    while i < self.size
      node = self.at(i)
      array.push(node.value)
      i += 1
    end
    puts array.join(' -> ')
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
node3 = Node.new(3)

linked_list = LinkedList.new
linked_list.append(node1)
linked_list.append(node2)
linked_list.prepend(node0)
puts "size of list is #{linked_list.size}"
puts "value of head: #{linked_list.head.value}"
puts "value of tail: #{linked_list.tail.value}"
# p linked_list.tail.next_node
linked_list.append(node3)
p linked_list.contains?(2)
p linked_list.find(2)

puts "size of list is #{linked_list.size}"
puts "value of head: #{linked_list.head.value}"
puts "value of tail: #{linked_list.tail.value}"

linked_list.to_s


