
# Sieve of Eratosthenes

max = 2_000_000 # 10,001st prime is probably less than 1 million

sieve = Array.new(max, true)
sieve[0] = false
sieve[1] = false

(2...max).each do |i|
  if sieve[i]
    (2 * i).step(max - 1, i) do |j|
      sieve[j] = false
    end
  end
end

sum = 0_u64

sieve.each_with_index { |prime, number| sum += number if prime }

puts sum # => 142913828922
