class Map
  def initialize
    @arr = []
  end

  def assign(key, value)
    found_index = lookup(key)
    if found_index.nil?
      @arr << [key, value]
    else
      @arr[found_index] = [key, value]
    end
  end

  def lookup(key)
    index = nil

    @arr.each_with_index do |pair, i|
      index = i if pair.first == key
    end

    index
  end

  def remove(key)
    @arr.delete_if { |pair| pair.first == key }
  end

  def show
    @arr
  end
end
