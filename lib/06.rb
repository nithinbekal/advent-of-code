class Day6
  def part1 = find_unique_string(4)
  def part2 = find_unique_string(14)

  private

  def find_unique_string(length)
    file.chars
      .each_cons(length)
      .find_index { |chars| chars.uniq.length == length }
      .then { _1 + length }
  end

  def file = File.read("input/06.txt")
end

puts Day6.new.part1
puts Day6.new.part2

