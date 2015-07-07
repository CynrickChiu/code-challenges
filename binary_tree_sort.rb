class BinaryTree

  attr_accessor :payload, :left, :right

  def initialize(payload=nil, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end

  def ==(other)
    payload == other.payload && left == other.left && right == other.right
  end

  def build_binary_tree(list)
    list.each do |item|
      add_node(item)
    end

    return self
  end

  def binary_tree_sort
    result = []

    unless left.nil?
      result << left.binary_tree_sort
    end

    result << payload

    unless right.nil?
      result << right.binary_tree_sort
    end
    
    result.flatten
  end

  def add_node(item)
    if payload.nil?
      self.payload = item
    else
      if item < payload
        if left.nil?
          self.left = BinaryTree.new(item, nil, nil)
        else
          left.add_node(item)
        end
      else
        if right.nil?
          self.right = BinaryTree.new(item, nil, nil)
        else
          right.add_node(item)
        end
      end
    end
  end

end
