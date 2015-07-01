class BinaryTree

  attr_accessor :payload, :left, :right

  def initialize(payload=nil, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end

  def build_binary_tree(list)
    list.each do |item|
      add_node(item, self)
    end

    return self
  end

  def binary_tree_sort
    result = []

    if !self.left.nil?
      result << self.left.binary_tree_sort
    end

    result << self.payload

    if !self.right.nil?
      result << self.right.binary_tree_sort
    end
    
    result.flatten
  end

  private

  def add_node(item, node)
    if node.payload.nil?
      node.payload = item
    else
      if item < node.payload
        if !node.left.nil?
          add_node(item, node.left)
        else
          node.left = BinaryTree.new(item, nil, nil)
        end
      else
        if !node.right.nil?
          add_node(item, node.right)
        else
          node.right = BinaryTree.new(item, nil, nil)
        end
      end
    end
  end

end