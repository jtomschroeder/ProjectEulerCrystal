
struct Number
  def factorial
    fact = 1_u64
    1.upto(self) { |i| fact *= i }
    fact
  end
end
