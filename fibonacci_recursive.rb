def fibs_rec(n, array = [0, 1])
  if n < 2
    array
  else
    array << array[-2] + array[-1]
    fibs_rec(n-1, array)
  end
  array
end

def fibonacci(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end

p fibs_rec(100)

p fibonacci(6)