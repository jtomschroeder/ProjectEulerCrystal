# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def gcd(a, b)
  return a if b == 0
  return gcd(b, a % b);
end
   
def lcm(a, b)
  return a * b / gcd(a,b)
end

puts (1_u64..20_u64).inject(1_u64) { |mem, var| lcm(mem, var) } # => 232792560
