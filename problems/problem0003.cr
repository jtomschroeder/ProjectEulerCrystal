# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

def first_factor(x)
  (2_u64..x).each { |i| return i if x % i == 0 }
  return 0_u64
end

factors = [] of UInt64
x = num = 600851475143_u64

while x > 1
  factors << first_factor(x)
  x /= factors.last
end

puts factors.max # => 6857
