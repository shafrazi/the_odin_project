module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    new_array = []
    self.my_each do |i|
      if yield(i)
        new_array << i
      end
    end
    new_array
  end

  def my_all?
    is_true = true
    self.my_each do |i|
      if !yield(i)
        is_true = false
      end
    end
    is_true
  end

  def my_any?
    any = false
    self.my_each do |i|
      if yield(i)
        any = true
      end
    end
    any
  end

  def my_none?
    none = true
    self.my_each do |i|
      if yield(i)
        none = false
      end
    end
    none
  end

  def my_count
    count = 0
    self.my_each do |i|
      if yield(i)
        count += 1
      end
    end
    count
  end

  def my_map
    new_array = []
    self.my_each do |i|
      new_array << yield(i)
    end
    new_array
  end

  def my_inject(value = 0)
    self.my_each do |result = value, i|
      value = yield(result, i)
    end
    value
  end
end

array = [1, 2, 3, 4, 5, 6, 7]


array.my_each do |element|
  puts element * 2
end

array.my_each_with_index {|num, i| puts "index of #{num} is #{i}"}

p array.my_select {|element| element > 3}

p array.my_all? {|item| item > 0 }

p array.my_any? {|item| item == 8 }

p array.my_none? {|item| item > 8 }

p array.my_count {|item| item > 2 }

p array.my_map {|item| item ** 2 }

p array.my_inject(1) { |sum, item| sum * item }

def multiply_els(arr)
  arr.my_inject(1) {|sum, i| sum * i}
end

p multiply_els([2, 4, 5])
