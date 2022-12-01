
calories = File.read("input/01.txt")
  .split("\n\n")
  .map { |line| line.split("\n").map(&:to_i).sum }
  .sort

part_1 = calories.last
part_2 = calories.last(3).sum

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"
