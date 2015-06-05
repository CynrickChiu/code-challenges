require 'minitest/autorun'
require_relative 'linked_list_1'

class TestLinkedList < Minitest::Test
  def setup
    @stack = Stack.new
    @val1 = 37
    @val2 = 99
  end

  def test_stack_push
    @stack.push(@val1)
    assert_equal 37, @stack.value
  end

  def test_stack_pop
    @stack.push(@val1)
    @stack.push(@val2)
    @stack.pop
    assert_equal 37, @stack.value
  end

  def test_print_values
  	@node1 = LinkedListNode.new(37)
    @node2 = LinkedListNode.new(99, @node1)
    @node3 = LinkedListNode.new(12, @node2)
    assert_output("12 --> 99 --> 37 --> nil\n") { print_values(@node3) }
  end

  def test_print_values_using_stack
    @stack.push(@val1)
    @stack.push(@val2)
    assert_output("99 --> 37 --> nil\n") { print_values(@stack) }
  end

  def test_reverse_list
  	@node1 = LinkedListNode.new(37)
    @node2 = LinkedListNode.new(99, @node1)
    @node3 = LinkedListNode.new(12, @node2)
    reversed = reverse_list(@node3)
    assert_output("37 --> 99 --> 12 --> nil\n") { print_values(reversed) }
  end
end