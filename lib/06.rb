class Day6
  def part1
    batches = file.chars.each_cons(4).to_a
    seq = batches.find { |chars| chars.uniq.length == 4 }
    batches.index(seq) + 4
  end

  def part2
    batches = file.chars.each_cons(14).to_a
    seq = batches.find { |chars| chars.uniq.length == 14 }
    batches.index(seq) + 14
  end

  private

  def file = @file ||= File.read("input/06.txt")
  def lines = File.readlines("input/06.txt", chomp: true)
end
