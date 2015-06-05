class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data
  
  def initialize
    @data = nil
  end

  def value
    @data.value if @data
  end

  def next_node
    @data.next_node if @data
  end

  # Push an item onto the stack
  def push(element)
    @data = LinkedListNode.new(element, @data)
  end

  # Pop an item off the stack.  
  # Remove the last item that was pushed onto the
  # stack and return it to the user
  def pop
    return nil if @data.nil?
    head_node = @data.value
    @data = @data.next_node
    return head_node
  end

end

def print_values(list_node)
  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end

def reverse_list(list)
  reversed = Stack.new

  while list
  	reversed.push(list.value)
    list = list.next_node
  end

  reversed
end