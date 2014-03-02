# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
# 
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. 
# By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. 
# However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot 
# be expressed as the sum of two abundant numbers is less than this limit.
# 
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require "problem"

problem 23 do
  code do
    abundant_numbers = [] of Int32
    12.upto(28123) do |i|
      divisors = [] of Int32
      1.upto(i - 1) { |j| divisors << j if i % j == 0 }
      abundant_numbers << i if divisors.sum > i
    end
    sum_abundant = Array.new(28123 + 1, false)
    abundant_numbers.each_with_index do |num, i|
      i.upto(abundant_numbers.size - 1) do |j|
        sum_abundant[num + abundant_numbers[j]] = true if (num + abundant_numbers[j]) < sum_abundant.size
      end
    end
    sum = 0
    sum_abundant.each_with_index do |e, i|
      sum += i if !e
    end
    sum
  end
  expect 4179871
end
