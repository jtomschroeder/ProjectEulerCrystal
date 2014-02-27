
class Bignum

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

  def initialize(@num_array : Array(Int32))
  end

  def *(num : Number)
    overflow = 0
    ary = @num_array.map do |n|
      tmp = n * num + overflow
      overflow = tmp / 10
      tmp % 10
    end

    while overflow > 0
      ary << overflow % 10
      overflow /= 10
    end
    Bignum.new(ary)
  end

  def *(num : Bignum)
    self * num.to_i # TODO: this isn't good but oh well
  end

  def +(num : Bignum)
    num_digits = num.digits
    ary = @num_array.clone

    while ary.length < num_digits.length
      ary << 0 
    end
    while ary.length > num_digits.length
      num_digits << 0 
    end

    overflow = 0
    ary = num_digits.map_with_index do |n, i|
      tmp = n + @num_array[i] + overflow
      overflow = tmp / 10
      tmp % 10
    end

    while overflow > 0
      ary << overflow % 10
      overflow /= 10
    end

    Bignum.new(ary)
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
    @num_array.clone
  end
end
