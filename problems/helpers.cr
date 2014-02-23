
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
end
