fish = [
  'fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'
]

#O(n^2)
def sluggish
  fish.each_with_index do |fish1, i|
    fish.each_with_index do |fish2, j|
      break if fish1.length < fish2.length
      return fish1 if j == fish.length - 1
    end
  end
end

#O(n log n)
class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    left = self.take(midpoint).merge_sort(&prc)
    right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left).concat(right)
  end
end

#O(n)
def clever
  longest = nil

  fish.each do |fish|
    longest = fish if longest.nil? || longest.length < fish.length
  end

  longest
end


tiles_array = [
  "up", "right-up", "right", "right-down",
  "down", "left-down", "left",  "left-up"
]

#O(n)
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index { |el, i| return i if el == direction }
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

#O(1)
def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
