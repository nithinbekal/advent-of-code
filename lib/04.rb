class Day4
  def part1
    ranges.count { |r1, r2|
      overlap = r1.to_a & r2.to_a
      r1.to_a == overlap || r2.to_a == overlap
    }
  end

  def part2
    ranges.count { (_1.to_a & _2.to_a).any? }
  end

  private

  def lines = File.readlines("input/04.txt", chomp: true)

  def ranges
    lines
      .map { _1.split(",") }
      .map { |range| range.map { _1.split("-").map(&:to_i) }.map { _1.._2 } }
  end
end
