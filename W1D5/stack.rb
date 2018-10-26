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

class Map
  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, value)
    idx = map.index { |arr| arr[0] == key }
    if idx
      map[idx][1] = value
    else
      map << [key, value]
    end
  end

  def get(key)
    map.each { |arr| return arr[1] if arr[0] == key}
    nil
  end

  def delete(key)
    value = get(key)
    map.reject! { |arr| arr[0] == key }
  end

  def show
    print map
  end

end
