def fibs(n)
  array = [0, 1]
  (2..n).each do |i|
    array << array[i-1] + array[i-2]
  end
  array
end

p fibs(100)
