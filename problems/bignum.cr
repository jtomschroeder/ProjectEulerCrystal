
struct Bignum

  def initialize(num = 0)
    @num_array = [] of Int32
    if num == 0
      @num_array << 0
    else
      while num > 0
        @num_array << (num % 10)
        num /= 10
      end
    end
  end

  def *(num : Number)
    overflow = 0
    @num_array.map! do |n|
      tmp = n * num + overflow
      overflow = tmp / 10
      tmp % 10
    end

    while overflow > 0
      @num_array << overflow % 10
      overflow /= 10
    end
    self
  end

  def *(num : Bignum)
    self * num.to_i # TODO: this isn't good but oh well
  end

  def to_i
    num = 0
    @num_array.each_with_index { |n, i| num += (10 ** i) * n  }
    num
  end

  def to_s
    str = ""
    @num_array.reverse_each { |i| str += i.to_s }
    str
  end

  def digits
    @num_array.reverse
  end

end

#fact = Bignum.new(1)
#2.upto(30) { |i| fact *= i }
#puts fact.digits
