class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    stack.push(el)
  end

  def pop
    # removes one element from the stack
    stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    stack.last
  end
end


class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end
end
