require 'minitest/autorun'

module Luhn
  def self.is_valid?(number)
    numbers_array = number.to_s.split("").map { |number| number.to_i }
    
    numbers_array = numbers_array.map.with_index do |number, index|
      if index % 2 == 0
        number + number >= 10 ? number + number - 9 : number + number
      else
        number
      end
    end
    
    sum = numbers_array.reduce(:+)
    
    sum % 10 == 0 ? true : false
  end
end

class TestLuhn < MiniTest::Unit::TestCase
  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    refute Luhn.is_valid?(4194560385008505)
  end
end