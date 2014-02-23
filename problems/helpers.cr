
struct Number
  def divisible_by?(num)
    self % num == 0
  end

  def even?
    self.divisible_by?(2)
  end

  def odd?
    !even?
  end

  def factorial
    fact = 1_u64
    1.upto(self) { |i| fact *= i }
    fact
  end
end
