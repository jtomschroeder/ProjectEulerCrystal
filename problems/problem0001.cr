# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

require "helpers"

puts (1..999).select { |i| i.divisible_by?(3) || i.divisible_by?(5) }.inject(0) { |sum, i| sum += i } # => 233168
