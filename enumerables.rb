module Enumerable
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
  end

  def my_each_method
    for i in self
      yield(i)
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
