require "set"

class Knot < Struct.new(:x, :y)
  def move_towards(knot)
    return unless too_far_from?(knot)

    if knot.x == x
      self.y += (knot.y < y ? -1 : 1)
    elsif knot.y == y
      self.x += (knot.x < x ? -1 : 1)
    else
      self.y += (knot.y < y ? -1 : 1)
      self.x += (knot.x < x ? -1 : 1)
    end
  end

  private

  def too_far_from?(knot)
    (x - knot.x).abs > 1 || (y - knot.y).abs > 1
  end
end

def part1 = calculate_tail_visits(2)
def part2 = calculate_tail_visits(10)

def calculate_tail_visits(knot_count)
  knots = knot_count.times.map { Knot.new(0, 0) }
  visited = Set[[0, 0]]

  fetch_moves.each do |direction, distance|
    move_knots(direction, distance, knots, visited)
  end

  visited.length
end

def fetch_moves
  moves = lines.map do |line|
    direction, distance = line.split
    [direction, distance.to_i]
  end
end

def move_knots(direction, distance, knots, visited)
  head = knots.first
  tail = knots.last

  distance.times do
    case direction
    when "R" then head.x += 1
    when "L" then head.x -= 1
    when "U" then head.y += 1
    when "D" then head.y -= 1
    end

    knots.each_cons(2) do |k1, k2|
      k2.move_towards(k1)
      visited << [tail.x, tail.y]
    end
  end
end

def lines = File.readlines("input/09.txt", chomp: true)

puts part1
puts part2
