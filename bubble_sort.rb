def all_sorted?(array)
  all_sorted = true
  array.each_with_index do |num, i|
    if array[i + 1] != nil
      if (num <=> array[i + 1]) > 0
        all_sorted = false
      end
    end
  end
  all_sorted
end

def sort(array)
  while !all_sorted?(array)
    array.each_with_index do |num, i|
      if array[i+1] != nil
        if (num <=> array[i+1]) > 0
          array[i] = array[i+1]
          array[i+1] = num
        end
      end
    end
  end
  array
end

def bubble_sort_by(array)
  all_sorted = false
  while !all_sorted
    all_sorted = true
    array.each_with_index do |element, i|
      if array[i + 1] != nil
        if (yield(element, array[i+1]) > 0)
          array[i] = array[i+1]
          array[i+1] = element
          all_sorted = false
        end
      end
    end
  end
  array
end

new_array = bubble_sort_by(["hi","hello","hey", "I"]) do |left, right|
  left.length - right.length
end

p new_array
