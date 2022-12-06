class Day6
  def part1 = find_unique_string(4)
  def part2 = find_unique_string(14)

  private

  def find_unique_string(length)
    batches = file.chars.each_cons(length).to_a
    seq = batches.find { |chars| chars.uniq.length == length }
    batches.index(seq) + length
  end

  def file = @file ||= File.read("input/06.txt")
end
