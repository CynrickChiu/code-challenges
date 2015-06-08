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

def reverse_list(list, previous=nil)
  head = list
  
  while head
    tail = head.next_node
    head.next_node = previous

    previous = head
    head = tail
  end

  previous
end

# def floyd_detection(list=nil)
#   return false if list.nil? || list.next_node.nil?
#   tortoise = list
#   hare = list.next_node

#   return false if hare.next_node.nil?
#   hare = hare.next_node

#   while tortoise != hare
#     tortoise = tortoise.next_node

#     return false if hare.next_node.nil?
#     hare = hare.next_node

#     return false if hare.next_node.nil?
#     hare = hare.next_node
#   end

#   return true
# end

def floyd_detection(list=nil)
  return false if list.nil?
  hare = list
  tortoise = list

  loop do
    return false if hare.nil?
    hare = hare.next_node

    return false if hare.nil?
    hare = hare.next_node

    tortoise = tortoise.next_node

    return true if hare == tortoise
  end
end