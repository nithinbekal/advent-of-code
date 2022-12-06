class Day3
  def part1
    lines.sum { priority(common_item(_1)) }
  end

  def part2
    lines.each_slice(3).sum { group_priorities(_1) }
  end

  private

  def lines = File.readlines("input/03.txt", chomp: true)

  def priority(c)
    case c
    when 'a'..'z' then c.ord - 96
    when 'A'..'Z' then c.ord - 64 + 26
    end
  end

  def common_item(r) = (rucksack_h1(r).chars & rucksack_h2(r).chars).first

  def rucksack_h1(r) = r[0..(r.size/2 - 1)]
  def rucksack_h2(r) = r[(r.size/2)..]

  def group_priorities(rucksacks)
    first, *rest = rucksacks.map(&:chars)
    priority(first.intersection(*rest).first)
  end
end

puts Day3.new.part1
puts Day3.new.part2
