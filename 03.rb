input = ARGF.read.split("\n")

# part 1
input
  .tally
  .max_by { it.last }
  .then { it.first }
  .tap { puts it }

colors = [:red, :green, :blue]
bushes = input
  .map do |line|
    nums = line.split(',').map(&:to_i)
    next :special if nums.uniq.size != nums.size
    nums
      .each_with_index
      .max_by { it.first }
      .then { colors[it.last] }
  end

# part 2
bushes
  .count { it == :green }
  .tap { puts it }

# part 3
prices = {
  red: 5,
  green: 2,
  blue: 4,
  special: 10,
}
bushes
  .sum { prices[it] }
  .tap { puts it }
