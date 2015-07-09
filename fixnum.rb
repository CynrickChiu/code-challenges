class Fixnum
  def digits(base=10)
    q, r =  divmod(base)
    (q > 0 ? q.digits : []) + [r]
  end
end

