array = [17,3,6,9,15,8,6,1,10]

def stock_picker(arr)
  highest_profit = 0
  profit_array = []
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      if highest_profit < (arr[j] - arr[i])
        highest_profit = arr[j] - arr[i]
        profit_array.push([i, j])
      end
      j += 1
    end
    i += 1
  end
  return profit_array.last
end

stock_picker(array)
