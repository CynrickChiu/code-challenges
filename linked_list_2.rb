class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
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

# iterative version
def reverse_list(list, previous=nil)
  while list
    tail = list.next_node
    list.next_node = previous

    previous = list
    list = tail
  end

  previous
end

# recursive version
# def reverse_list(list, previous=nil)
#   return previous unless list
#   next_node = list.next_node
#   list.next_node = previous
#   reverse_list(next_node, list)
# end

# cleaner version of floyd_detection
def floyd_detection(list=nil)
  increment = Proc.new do |node|
    return false if node.nil?
    node.next_node
  end

  hare = list
  tortoise = list

  loop do
    hare = increment.call(increment.call(hare))
    tortoise = increment.call(tortoise)
    return true if hare == tortoise
  end
end

# def floyd_detection(list=nil)
#   return false if list.nil?
#   hare = list
#   tortoise = list

#   loop do
#     return false if hare.nil?
#     hare = hare.next_node

#     return false if hare.nil?
#     hare = hare.next_node

#     tortoise = tortoise.next_node

#     return true if hare == tortoise
#   end
# end