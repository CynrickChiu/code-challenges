require 'minitest/autorun'
require_relative 'binary_tree_sort'

class BinaryTreeSort < Minitest::Test
  def setup
    @first = BinaryTree.new(1, nil, nil)
    @sixth = BinaryTree.new(6, nil, nil)
    @fourth = BinaryTree.new(4, @first, @sixth)
    @tenth = BinaryTree.new(10, nil, nil)
  	@fourteenth = BinaryTree.new(14, @tenth, nil)
    @ninth = BinaryTree.new(9, nil, @fourteenth)
    @tree = BinaryTree.new(7, @fourth, @ninth)
  end

  def test_build_binary_tree
    trunk = BinaryTree.new
    list = [7, 4, 9, 1, 6, 14, 10]
    assert_equal @tree, trunk.build_binary_tree(list)
  end

  def test_binary_tree_sort
    result = [1, 4, 6, 7, 9, 10, 14]
    assert_equal result, @tree.binary_tree_sort
  end
end