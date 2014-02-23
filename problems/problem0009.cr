# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
         
# Euclid's formula

(1..1000).each do |m|
  (1..1000).each do |n|
    (1..1000).each do |k|
      if m > n
        a = k * (m ** 2 - n ** 2)
        b = k * (2 * m * n)
        c = k * (m ** 2 + n ** 2)
        if a + b + c == 1000
          puts a * b * c # => 31875000
          exit
        end
      end
    end
  end
end
