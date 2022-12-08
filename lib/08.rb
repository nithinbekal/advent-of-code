
def part1
  grid = lines.map { _1.to_s.chars.map(&:to_i) }

  grid
    .each_with_index
    .sum { |row, i| row.each_with_index.count { |col, j| visible?(grid, i, j) } }
end

def part2
  grid = lines.map { _1.to_s.chars.map(&:to_i) }

  grid
    .map.with_index { |row, i| row.map.with_index { |col, j| scenic_index(grid, i, j) }.max }
    .max
end

def lines = File.readlines("input/08.txt", chomp: true)

def visible?(grid, row, col)
  return true if row == 0
  return true if col == 0
  return true if row == grid.length - 1
  return true if col == grid.first.length - 1

  h = grid[row][col].to_i
  current_row = grid[row]
  current_col = grid.map { _1[col] }

  current_row[0..col-1].none? { _1.to_i >= h } ||
    current_row[col+1..-1].none? { _1.to_i >= h } ||
    current_col[0..row-1].none? { _1.to_i >= h } ||
    current_col[row+1..-1].none? { _1.to_i >= h }
end

def scenic_index(grid, i, j)
  h = grid[i][j]
  row = grid[i]
  col = grid.map { _1[j] }

  lview = j.zero? ? [] : row[..j-1].reverse
  rview = row[j+1..]
  tview = i.zero? ? [] : col[..i-1].reverse
  bview = col[i+1..]

  [
    viewing_distance(lview, h),
    viewing_distance(rview, h),
    viewing_distance(tview, h),
    viewing_distance(bview, h),
  ].reduce(&:*)
end

def viewing_distance(trees, h)
  return 0 if trees.empty?
  if length = trees.find_index { _1 >= h }
    length + 1
  else
    trees.length
  end
end

puts part1
puts part2
