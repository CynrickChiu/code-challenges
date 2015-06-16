class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end
end

def dfs_recursive(node, search_value)
  return node if node.payload == search_value
  
  node.children.each do |child|
  	# puts "child: #{child.inspect}"
    search = dfs_recursive(child, search_value)
    # puts "search: #{search.inspect}"
    return search unless search.nil?
  end

  return nil
end

def dfs_iterative(node, search_value)
  stack = [node]

  while stack.size > 0
    if stack[0].payload == search_value
      return stack[0]
    else
    	temp = stack.shift

      temp.children.reverse.each do |child|
        stack.unshift(child)
      end
    end
    # puts stack.inspect
  end

  return nil
end

##########

class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

def bfs(node, search_value)
  queue = Queue.new

  queue.enqueue(node)

  while queue.queue.size > 0
    if queue.queue[0].payload == search_value
      return queue.queue[0]
    else
      temp = queue.dequeue

      temp.children.each do |child|
        queue.enqueue(child)
      end
    end
    # puts queue.inspect
  end

  return nil
end