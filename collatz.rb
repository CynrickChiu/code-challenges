def collatz_iterative(n)
  counter = 1

  until n == 1
    # original version
    # if n % 2 == 0
    #   n = n / 2
    #   puts n
    #   next
    # end

    # n = 3 * n + 1 if n % 2 == 1

    # refactored version
    n % 2 == 0 ? n = n / 2 : n = 3 * n + 1
    counter += 1
  end

  counter
end

def longest_collatz_sequence_iterative
  result_number = 1
  longest_sequence = 1

  (1..1000000).each do |n|
    if collatz_iterative(n) > longest_sequence
      result_number = n
      longest_sequence = collatz_iterative(n)
    end
  end

  result_number
end

def collatz_recursive(n)
  if n == 1
    1
  else
    n % 2 == 0 ? 1 + collatz_recursive(n / 2) : 1 + collatz_recursive(3 * n + 1)
  end
end

def longest_collatz_sequence_recursive
  result_number = 1
  longest_sequence = 1

  (1..1000000).each do |n|
    if collatz_recursive(n) > longest_sequence
      result_number = n
      longest_sequence = collatz_recursive(n)
    end
  end

  result_number
end