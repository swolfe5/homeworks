class Queue
  def initialize
    @arr = []
  end

  def enqueue(el)
    @arr << el
  end

  def dequeue
    @arr.shift
  end

  def show
    @arr
  end
end
