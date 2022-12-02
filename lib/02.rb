
class Day2
  ABC_TO_RPS = { "A" => :rock, "B" => :paper, "C" => :scissors }
  XYZ_TO_RPS = { "X" => :rock, "Y" => :paper, "Z" => :scissors }

  XYZ_TO_RESULT = { "X" => :lose, "Y" => :draw, "Z" => :win }

  POINTS_FOR_MOVE = { rock: 1, paper: 2, scissors: 3 }

  STATES = POINTS_FOR_MOVE.keys

  def part_1
    file.lines
      .map { parse_game(_1) }
      .then { points_total(_1) }
  end

  def part_2
    file.lines
      .map { parse_game_2(_1) }
      .then { transform_results_to_games(_1) }
      .then { points_total(_1) }
  end

  private

  def file = @file ||= File.read("input/02.txt")

  def parse_game(line) = line.split.map { parse_move(_1) }

  def parse_move(move) = ABC_TO_RPS[move] || XYZ_TO_RPS[move]

  def points_for_move(move) = POINTS_FOR_MOVE[move]

  def points_for_result(theirs, mine)
    case mine
    when winning_move_against(theirs) then 6
    when losing_move_against(theirs) then 0
    when theirs then 3
    end
  end

  def winning_move_against(move) = STATES[STATES.index(move) - 2]
  def losing_move_against(move) =  STATES[STATES.index(move) - 1]

  def points_total(games)
    games.reduce(0) do |total, (theirs, mine)|
      total + points_for_move(mine) + points_for_result(theirs, mine)
    end
  end

  def parse_game_2(line) = line.split.map { ABC_TO_RPS[_1] || XYZ_TO_RESULT[_1] }

  def transform_results_to_games(games)
    games.map do |theirs, result|
      case result
      when :win  then [theirs, winning_move_against(theirs)]
      when :lose then [theirs, losing_move_against(theirs)]
      when :draw then [theirs, theirs]
      end
    end
  end
end

day2 = Day2.new

puts "Part 1: #{day2.part_1}"
puts "Part 2: #{day2.part_2}"
