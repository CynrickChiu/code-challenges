require 'minitest/autorun'
require_relative 'linked_list_2'

class TestLinkedList < Minitest::Test
  def setup
    @node1 = LinkedListNode.new(37)
    @node2 = LinkedListNode.new(99, @node1)
    @node3 = LinkedListNode.new(12, @node2)
  end

  def test_print_values
    assert_output("12 --> 99 --> 37 --> nil\n") { print_values(@node3) }
  end

  def test_reverse_list_nil_list
    assert_equal nil, reverse_list(nil)
  end

  def test_reverse_list_1_node
    reversed = reverse_list(@node1)
    assert_output("37 --> nil\n") { print_values(reversed) }
  end

  def test_reverse_list_3_nodes
    reversed = reverse_list(@node3)
    assert_output("37 --> 99 --> 12 --> nil\n") { print_values(reversed) }
  end

  def test_floyd_nil_list
    assert_equal false, floyd_detection(nil)
  end

  def test_floyd_finite_list
    assert_equal false, floyd_detection(@node3)
  end

  def test_floyd_infinite_list
    @node1.next_node = @node3
    assert_equal true, floyd_detection(@node3)
  end
end