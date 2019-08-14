array = [14, 7, 3, 12, -9, 11, 6, -2]
# array = [3, 7, 12, 14, 2, 6, 9, 11]
a = 0
z = array.length - 1
q = (a+z)/ 2

def merge(array, a, q, z)
  low_half = []
  high_half = []
  i = 0
  j = 0
  k = a

  while k <= q
    low_half[i] = array[k]
    i += 1
    k += 1
  end

  while k <= z
    high_half[j] = array[k]
    j += 1
    k += 1
  end
  
  i = 0
  j = 0
  k = a
  
  while i < low_half.length && j < high_half.length
    if low_half[i] < high_half[j]
      array[k] = low_half[i]
      i += 1
    else
      array[k] = high_half[j]
      j += 1
    end
    k += 1
  end
  
  while i < low_half.length
    array[k] = low_half[i]
    i += 1
    k += 1
  end

  while j < high_half.length
    array[k] = high_half[j]
    j += 1
    k += 1
  end
end

def merge_sort(array, a, z)
  if a < z
    q = (a + z) / 2
    merge_sort(array, a, q)
    merge_sort(array, q+1, z)
    merge(array, a, q, z)
  end 
end

merge_sort(array, a, z)
# merge(array, a, q, z)
p array
