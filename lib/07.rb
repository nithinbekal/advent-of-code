
class Day7
  UPDATE_SIZE = 30_000_000
  TOTAL = 70_000_000

  def part1
    fetch_all_dirs
      .select { |dir| dir.size <= 100000 }
      .sum(&:size)
  end

  def part2
    all_dirs = fetch_all_dirs

    need = UPDATE_SIZE - (TOTAL - all_dirs.first.size)

    all_dirs
      .sort_by(&:size)
      .find { |dir| dir.size > need }
      .size
  end

  private

  def fetch_all_dirs
    root = Dir.new("/", nil)
    curdir = root
    all_dirs = [root]

    lines.each do |line|
      if line.start_with?("$ cd /")
        # noop

      elsif line.start_with?("$ ls")
        # noop

      elsif line.start_with?("dir")
        dir = Dir.new(line.split[1], curdir)
        curdir.files << dir
        all_dirs << dir

      elsif line.start_with?("$ cd ..")
        curdir = curdir.parent

      elsif line.start_with?("$ cd ")
        name = line.split[2]
        dir = curdir.files.find { _1.name == name }
        curdir = dir

      elsif line.match(/\A\d+/)
        size, name = line.split
        curdir.files << File.new(name, size.to_i)
      end
    end

    all_dirs
  end

  def file = File.read("input/07.txt")
  def lines = File.readlines("input/07.txt", chomp: true)
end

class Dir
  def initialize(name, parent)
    @name = name
    @parent = parent
    @files = []
  end

  attr_reader :name, :files, :parent

  def size
    files.sum(&:size)
  end
end

class File
  def initialize(name, size)
    @name = name
    @size = size
  end

  attr_reader :name, :size
end

puts Day7.new.part1
puts Day7.new.part2
