
class Day5
  def part1
    crates = fetch_crates

    rearragements.each do |n, from, to|
      crates[to-1] = crates[from-1].shift(n).reverse + crates[to-1]
    end

    crates.map { _1.first[1] }.reduce(&:+)
  end

  def part2
    crates = fetch_crates

    rearragements.each do |n, from, to|
      crates[to-1] = crates[from-1].shift(n) + crates[to-1]
    end

    crates.map { _1.first[1] }.reduce(&:+)
  end

  private

  def file = @file ||= File.read("input/05.txt")

  def items_in_crate_line(line)
    line.chars.each_slice(4).map(&:join).map(&:strip)
  end

  def fetch_crates
    crates_raw
      .map { items_in_crate_line(_1) }
      .transpose
      .map { _1.reject(&:empty?) }
  end

  def crates_raw
    file.split("\n\n").first.lines.tap(&:pop)
  end

  def rearragements
    file.split("\n\n").last.lines.map do |line|
      _, n, _, from, _, to = line.split
      [n, from, to].map(&:to_i)
    end
  end
end

day = Day5.new

puts day.part1
puts day.part2
