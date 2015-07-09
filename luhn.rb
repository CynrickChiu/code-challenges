require 'minitest/autorun'
require_relative 'fixnum'

module Luhn
  def self.is_valid?(number)
    numbers_array = number.digits.reverse

    numbers_array.map!.with_index do |number, index|
      if index % 2 == 1
        number += number
        number -= 9 if number >= 10
      end
      number
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
