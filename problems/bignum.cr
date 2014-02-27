
lib LibMP("gmp")

  struct MPZ
    _mp_alloc : Int32
    _mp_size  : Int32
    _mp_d     : UInt64*
  end

  ## Initialization

  fun __gmpz_init(x : MPZ*) : Void
  fun __gmpz_set_ui(rop : MPZ*, op : UInt64) : Void

  ## I/O

  fun __gmpz_out_str(stream : Int32, base : Int32, op : MPZ*) : UInt64
  fun __gmpz_set_str(rop : MPZ*, str : UInt8*, base : Int32) : Int32
  fun __gmpz_get_str(str : UInt8*, base : Int32, op : MPZ*) : UInt8*

  ## Arithmetic

  # void mpz_add (mpz_t rop, const mpz_t op1, const mpz_t op2)
  fun __gmpz_add(rop : MPZ*, op1 : MPZ*, op2 : MPZ*) : Void
  # void mpz_add_ui (mpz_t rop, const mpz_t op1, unsigned long int op2)

  # void mpz_sub (mpz_t rop, const mpz_t op1, const mpz_t op2)
  # void mpz_sub_ui (mpz_t rop, const mpz_t op1, unsigned long int op2)
  # void mpz_ui_sub (mpz_t rop, unsigned long int op1, const mpz_t op2)

  fun __gmpz_mul(rop : MPZ*, op1 : MPZ*, op2 : MPZ*) : Void
  fun __gmpz_mul_si(rop : MPZ*, op1 : MPZ*, op2 : Int32) : Void # TODO: op2 : long int
  fun __gmpz_mul_ui(rop : MPZ*, op1 : MPZ*, op2 : UInt32) : Void # TODO: op2 : unsigned long int

  # void mpz_addmul (mpz_t rop, const mpz_t op1, const mpz_t op2)
  # void mpz_addmul_ui (mpz_t rop, const mpz_t op1, unsigned long int op2)

  # void mpz_submul (mpz_t rop, const mpz_t op1, const mpz_t op2)
  # void mpz_submul_ui (mpz_t rop, const mpz_t op1, unsigned long int op2)

  # void mpz_mul_2exp (mpz_t rop, const mpz_t op1, mp_bitcnt_t op2)

  # void mpz_neg (mpz_t rop, const mpz_t op)

  # void mpz_abs (mpz_t rop, const mpz_t op)
end

class Bignum
  
  #macro _mpz "pointerof(@mpz) as LibMP::MPZ*" end

  def initialize
    @mpz = 0
    LibMP.__gmpz_init(internal)
  end

  def initialize(str : String)
    @mpz = 0
    LibMP.__gmpz_init(internal)
    LibMP.__gmpz_set_str(internal, str, 10)
    #LibMP.__gmpz_out_str(0, 10, internal)
  end

  def initialize(num : Number)
    @mpz = 0
    LibMP.__gmpz_init(internal)
    LibMP.__gmpz_set_str(internal, num.to_s, 10)
  end

  def *(num : Int32)
    rop = Bignum.new
    LibMP.__gmpz_mul_si(rop.internal, internal, num)
    rop
  end

  #def *(num : Bignum) 
  #end

  def +(num : Bignum)
    rop = Bignum.new
    LibMP.__gmpz_add(rop.internal, internal, num.internal)
    rop
  end

  def to_i
    
  end

  def to_s
    String.new(LibMP.__gmpz_get_str(nil, 10, internal))
  end

  def digits
    ary = [] of Int32
    self.to_s.each_char { |c| ary << c - '0' }
    ary
  end

  def internal
    pointerof(@mpz) as LibMP::MPZ*
  end
end
