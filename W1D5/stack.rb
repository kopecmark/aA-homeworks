class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    self.push(el)
  end

  def pop
    # removes one element from the stack
    self.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    self.first
  end
end
