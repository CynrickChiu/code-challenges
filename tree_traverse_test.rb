require 'minitest/autorun'
require_relative 'tree_traverse'

class TreeTraverse < Minitest::Test
  def setup
    # The "Leafs" of a tree, elements that have no children
    @fifth_node = Tree.new(5, [])
    @eleventh_node = Tree.new(11, [])
    @fourth_node = Tree.new(4, [])

    # The "Branches" of the tree
    @ninth_node = Tree.new(9, [@fourth_node])
    @sixth_node = Tree.new(6, [@fifth_node, @eleventh_node])
    @seventh_node = Tree.new(7, [@sixth_node])
    @fifth_node = Tree.new(5, [@ninth_node])

    # The "Trunk" of the tree
    @trunk = Tree.new(2, [@seventh_node, @fifth_node])
  end

  def test_dfs_recursive_node_not_found
    result = dfs_recursive(@trunk, 3)
    assert_equal nil, result
  end

  def test_dfs_recursive_node_found
    result = dfs_recursive(@trunk, 11)
    assert_equal @eleventh_node, result
  end

  def test_dfs_iterative_node_not_found
    result = dfs_iterative(@trunk, 13)
    assert_equal nil, result
  end

  def test_dfs_iterative_node_found
    result = dfs_iterative(@trunk, 4)
    assert_equal @fourth_node, result
  end

  def test_bfs_node_not_found
    result = bfs(@trunk, 17)
    assert_equal nil, result
  end

  def test_bfs_node_found
    result = bfs(@trunk, 5)
    assert_equal @fifth_node, result
  end
end