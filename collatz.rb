def collatz_iterative(n)
  counter = 1

  until n == 1
    n = n % 2 == 0 ? n / 2 : 3 * n + 1
    counter += 1
  end

  counter
end

def collatz_recursive(n)
  if n == 1
    1
  else
    n % 2 == 0 ? 1 + collatz_recursive(n / 2) : 1 + collatz_recursive(3 * n + 1)
  end
end

def longest_collatz_sequence(func)
  result_number = 1
  longest_sequence = 1

  (1..1000000).each do |n|
    if func.call(n) > longest_sequence
      result_number = n
      longest_sequence = func.call(n)
    end
  end

  result_number
end

def longest_collatz_sequence_iterative
  longest_collatz_sequence(method(:collatz_iterative))
end

def longest_collatz_sequence_recursive
  longest_collatz_sequence(method(:collatz_recursive))
end