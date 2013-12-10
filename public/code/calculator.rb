def add(a, b)
  a + b
end 

def subtract(a, b)
  a - b
end

def sum(array)
  sum = 0
  array.each do |i|
    sum += i
  end
  sum
end

def multiply(*a)    # The * lets you call any number of arguments
  product = 1
  a.each do |i|
    product *= i
  end
  product
end

def power(base, exponent)
  base ** exponent
end

def factorial(n)
  return 1 if n == 0
  n * factorial(n - 1)  # recursive function
end