require 'minitest/autorun'
require_relative 'collatz'

class TestCollatz < Minitest::Test
  def test_collatz_iterative
    assert_equal 1, collatz_iterative(1)
    assert_equal 17, collatz_iterative(7)
  end

  def test_collatz_recursive
    assert_equal 1, collatz_recursive(1)
    assert_equal 17, collatz_recursive(7)
  end
end