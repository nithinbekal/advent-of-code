# Part 1

instructions = File.readlines("input/10.txt", chomp: true)

regx = 1
cycle = 0
readings = []

instructions.each do |ins|
  readings << regx

  case ins.split
  in ["noop"]
    cycle += 1

  in ["addx", v]
    readings << regx

    regx += v.to_i
    cycle += 2
  end
end

puts (20..).step(40).take(6).map { |cycle| cycle * readings[cycle-1] }.sum

# Part 2

screen = [" "] * 240

(0..239).each do |cycle|
  n = readings[cycle].remainder(40)

  if (n-1 .. n+1).include?(cycle % 40)
    screen[cycle] = "#"
  end
end

screen.each_slice(40).to_a.each do |slice|
  puts slice.join
end
