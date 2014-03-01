# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require "problem"

problem 21 do
  code do
    proper_divisors = [] of Int32
    0.upto(10_000) do |i|
      divisors = [] of Int32
      1.upto(i - 1) { |j| divisors << j if i % j == 0 }
      proper_divisors << divisors.sum
    end
    sum = 0
    len = proper_divisors.length
    proper_divisors.each_with_index { |n, i| sum += i if n < len && n != i && proper_divisors[n] == i }
    sum
  end
  expect 31626
end
