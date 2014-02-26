# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?

require "problem"

problem 16 do
  code do
    bignum = [1]

    1000.times do
      overflow = 0
      bignum.map! do |n|
        tmp = n * 2 + overflow
        overflow = tmp / 10
        tmp % 10
      end
      bignum << overflow if overflow > 0
    end

    bignum.sum
  end
  expect 1366
end
