
fibonacci = [1, 2]
loop do
  next_fib = (fibonacci[fibonacci.length - 1] + fibonacci[fibonacci.length - 2])
  break unless next_fib < 4_000_000
  fibonacci << next_fib
end

puts fibonacci.select { |i| i % 2 == 0 }.inject(0) { |sum, i| sum += i } # => 4613732
