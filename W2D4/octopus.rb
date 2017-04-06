fish = [
  'fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'
]

#O(n^2)
def sluggish
end


tiles_array = [
  "up", "right-up", "right", "right-down",
  "down", "left-down", "left",  "left-up"
]

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

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
